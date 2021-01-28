import 'dart:async';
import 'package:avs/data/models/request.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final Request request;

  const MapScreen({@required this.request});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double latitude;
  double longitude;

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController _mapController;
  Position _currentPosition;
  Set<Marker> markers = {};

  /// Subscription for location changes
  StreamSubscription streamSubscription;

  ///Polylines points for flutter
  PolylinePoints polylinePoints;

  /// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

  /// Map storing polylines created by connecting
  /// two points
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setLocationListener();
      latitude = widget.request.address.geo.coordinates[0];
      longitude = widget.request.address.geo.coordinates[1];
      placeMarker(latitude: latitude, longitude: longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          markers: markers,
          polylines: Set<Polyline>.of(polylines.values),
          initialCameraPosition: _initialLocation,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _mapController = controller;
          },
        ),
      ),
      Positioned(
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              width: 100,
              child: Center(
                child: Icon(CupertinoIcons.back),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  void getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POSITION: $_currentPosition');

        // For moving the camera to current location
        // _mapController.animateCamera(
        //   CameraUpdate.newCameraPosition(
        //     CameraPosition(
        //       target: LatLng(position.latitude, position.longitude),
        //       zoom: 18.0,
        //     ),
        //   ),
        // );
      });

      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              9.081999,
              8.675277,
              // position.latitude, position.longitude
            ),
            zoom: 5.0,
          ),
        ),
      );
    }).catchError((e) {
      print("error:$e");
    });
  }

  void placeMarker({double latitude, double longitude}) {
    /// Destination Location Marker
    Marker destinationMarker = Marker(
      markerId: MarkerId('Address'),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: 'Address to be verified',
        snippet: '${widget.request.address.streetAddress}',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    setState(() {
      markers.add(destinationMarker);

      ///Zoom in on destination marker
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 10.0,
          ),
        ),
      );
      print(markers.length);
    });
  }

  void setLocationListener() {
    streamSubscription = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.high, distanceFilter: 0)
        .listen((Position position) {
      setState(() {
        /// Store the position in the variable
        _currentPosition = position;

        print('CURRENT POSITION: $_currentPosition');

        print('This ran : Listener is set');
        createRoute(
          start: position,
        );
        calculateDistance(position);
      });
    });
  }

  void createRoute({@required Position start}) async {
    ///Flutter polylines
    polylinePoints = PolylinePoints();

    /// Generating the list of coordinates to be used for drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDWzGqryJyULurQz_nOuTz5L-tktCz60JE', // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(latitude, longitude),
      travelMode: TravelMode.driving,
    );

    print(result.points);
    print(result.status);

    /// Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      polylineCoordinates.clear();
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      ///What to do if route isn't available
    }
    print(polylineCoordinates.length);

    PolylineId id = PolylineId('poly');

    setState(() {
      Polyline polyline = Polyline(
        polylineId: id,
        color: AppColors.primaryColor,
        points: polylineCoordinates,
        width: 3,
      );

      polylines[id] = polyline;
    });
  }

  void calculateDistance(Position position) async {
    double distanceInMeters = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      latitude,
      longitude,
    );

    print('Distance: $distanceInMeters');
    if (distanceInMeters < 200) {
      ///Bring up form to verify address
      closeSubscription();
    }
  }

  void closeSubscription() {
    streamSubscription?.cancel();
  }

  @override
  void dispose() {
    closeSubscription();
    super.dispose();
  }
}
