import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController _mapController;
  Position _currentPosition;
  Set<Marker> markers = {};

  /// Subscription for location changes
  StreamSubscription streamSubscription;

  /// Google map polylines
  GoogleMapPolyline googleMapPolyline =
      GoogleMapPolyline(apiKey: 'AIzaSyDWzGqryJyULurQz_nOuTz5L-tktCz60JE');
  final Set<Polyline> polyline = {};

  ///

  /// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

  /// Map storing polylines created by connecting
  /// two points
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      getCurrentLocation();
      test();
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
          polylines: polyline,
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
      // Positioned(
      //   bottom: 40,
      //   right: 40,
      //   child: ClipOval(
      //     child: Material(
      //       color: AppColors.primaryColor[200],
      //       child: InkWell(
      //         splashColor: AppColors.primaryColor[300],
      //         child: SizedBox(
      //           width: 56,
      //           height: 56,
      //           child: Icon(Icons.my_location),
      //         ),
      //         onTap: () {
      //           // TODO: Add the operation to be performed
      //           // on button tap
      //         },
      //       ),
      //     ),
      //   ),
      // ),
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
      placeMarker(position);
      // createRoute(
      //   start: position,
      // );
    }).catchError((e) {
      print("error:$e");
    });
  }

  void placeMarker(Position position) {
// Destination Location Marker
    Marker destinationMarker = Marker(
      markerId: MarkerId('Address'),
      position: LatLng(
        9.081999,
        8.675277,
      ),
      infoWindow: InfoWindow(
        title: 'Destination',
        snippet: 'Address to be verified',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    // Destination Location Marker
    Marker userMarker = Marker(
      markerId: MarkerId('Address'),
      position: LatLng(
        9.081999,
        8.675277,
      ),
      infoWindow: InfoWindow(
        title: 'Destination',
        snippet: 'Address to be verified',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    setState(() {
      markers.add(destinationMarker);
      print(markers.length);
    });

    setState(() {
      markers.add(userMarker);
      print('${markers.length} 2nd');
    });
  }

  void test() {
    streamSubscription = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.high, distanceFilter: 0)
        .listen((Position position) {
      setState(() {
        /// Store the position in the variable
        _currentPosition = position;

        print('CURRENT POSITION: $_currentPosition');

        /// For moving the camera to current location
        // _mapController.animateCamera(
        //   CameraUpdate.newCameraPosition(
        //     CameraPosition(
        //       target: LatLng(
        //         // position.latitude, position.longitude
        //         9.081999,
        //         8.675277,
        //       ),
        //       zoom: 18.0,
        //     ),
        //   ),
        // );
        print('This ran : Listener is set');
        createRoute(
          start: position,
        );
      });
    });
  }

  // void createRoute({@required Position start}) async {
  //   /// Initializing PolylinePoints
  //   print('LOG: This working');
  //   polylinePoints = PolylinePoints();
  //
  //   // Generating the list of coordinates to be used for
  //   // drawing the polylines
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     'AIzaSyCItILbUMSoE40E-nSWcvJT_wDQofzl95A', // Google Maps API Key
  //     PointLatLng(start.latitude, start.longitude),
  //     PointLatLng(
  //         // 9.081999,
  //         // 8.675277,
  //         6.5244,
  //         3.3792),
  //     travelMode: TravelMode.transit,
  //   );
  //
  //   // Adding the coordinates to the list
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   }
  //
  //   setState(() {
  //     // Defining an ID
  //     PolylineId id = PolylineId('poly');
  //
  //     // Initializing Polyline
  //     Polyline polyline = Polyline(
  //       polylineId: id,
  //       color: Colors.red,
  //       points: polylineCoordinates,
  //       width: 3,
  //     );
  //
  //     /// Adding the polyline to the map
  //
  //     polylines[id] = polyline;
  //     print(polylines.toString());
  //   });
  // }

  void createRoute({@required Position start}) async {
    try {
      var route = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(start.latitude, start.longitude),
          destination: LatLng(6.5244, 3.3792),
          mode: RouteMode.walking);
    } catch (e) {
      print(e);
    }

    try {
      // setState(() {
      //   polyline.add(
      //     Polyline(
      //       polylineId: PolylineId('route1'),
      //       visible: true,
      //       points: route,
      //       width: 4,
      //       color: Theme.of(context).primaryColor,
      //       startCap: Cap.roundCap,
      //       endCap: Cap.buttCap,
      //     ),
      //   );
      // });
    } catch (e) {
      print('error:$e');
    }
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
