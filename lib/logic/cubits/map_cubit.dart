import 'dart:async';
import 'dart:io';
import 'package:avs/data/models/request.dart';
import 'package:avs/logic/cubits/map_state.dart';
import 'package:avs/presentation/screens/process_request_screen.dart';
import 'package:avs/utils/styles.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

class MapCubit extends Cubit<MapState> {
  final Request request;
  final GoogleMapController mapController;
  StreamSubscription streamSubscription;
  Set<Marker> markers = {};
  PolylinePoints polylinePoints;

  /// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

  /// Map storing polylines created by connecting
  /// two points
  Map<PolylineId, Polyline> polylines = {};

  MapCubit(this.request, this.mapController)
      : super(
            MapState(hasArrived: false, hasPermission: false, polylines: {})) {
    Future.delayed(Duration(seconds: 3), () {
      checkLocationPermission();
    });
  }

  void checkLocationPermission() async {
    if (await Permission.location.status != PermissionStatus.granted) {
      var permissionStatus = await Permission.location.request();

      if (permissionStatus == PermissionStatus.granted) {
        emit(state.copyWith(hasPermission: true));
        setLocationListener();
      } else {
        if (!state.hasError) {
          emit(state.copyWith(errorMessage: 'permission Denied'));
        }
      }
    } else {
      emit(state.copyWith(hasPermission: true));
      setLocationListener();
    }
  }

  void setLocationListener() {
    streamSubscription = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.high, distanceFilter: 0)
        .listen((Position position) {
      emit(state.copyWith(position: position));

      // mapController.animateCamera(
      //   CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //       target: LatLng(position.latitude, position.longitude
      //           // position.latitude, position.longitude
      //           ),
      //       zoom: 5.0,
      //     ),
      //   ),
      // );
      print('This ran : Listener is set');
      createRoute(
        start: position,
      );
      calculateDistance(position);
    });
  }

  void calculateDistance(Position position) {
    double distanceInMeters = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      request.address.geo.coordinates[0],
      request.address.geo.coordinates[1],
    );

    print('Distance: $distanceInMeters');
    if (distanceInMeters < 100) {
      emit(state.copyWith(hasArrived: true));
      closeSubscription();
    }
  }

  void createRoute({@required Position start}) async {
    ///Flutter polylines
    polylinePoints = PolylinePoints();

    try {} catch (e) {}

    /// Generating the list of coordinates to be used for drawing the polylines
    // PolylineResult result =
    await polylinePoints
        .getRouteBetweenCoordinates(
      'AIzaSyDWzGqryJyULurQz_nOuTz5L-tktCz60JE', // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(
        request.address.geo.coordinates[0],
        request.address.geo.coordinates[1],
      ),
      travelMode: TravelMode.driving,
    )
        .then((result) {
      /// Adding the coordinates to the list
      if (result.points.isNotEmpty) {
        polylineCoordinates.clear();
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      } else {
        emit(state.copyWith(errorMessage: 'Unable to find route'));
      }

      PolylineId id = PolylineId('poly');

      Polyline polyline = Polyline(
        polylineId: id,
        color: AppColors.primaryColor,
        points: polylineCoordinates,
        width: 3,
      );

      polylines[id] = polyline;

      emit(state.copyWith(polylines: polylines));
    }).catchError((e) {
      if (e is SocketException && !state.hasError) {
        emit(state.copyWith(errorMessage: 'Please check network connection'));
      } else if (!state.hasError) {
        emit(state.copyWith(errorMessage: 'Unable to fetch route'));
      }
    });
  }

  handleClick(buildContext) async {
    await Navigator.push(
        buildContext,
        PageTransition(
            type: PageTransitionType.bottomToTop,
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 400),
            settings: RouteSettings(arguments: request),
            child: ProcessRequestScreen()));
  }

  void closeSubscription() {
    streamSubscription?.cancel();
  }
}
