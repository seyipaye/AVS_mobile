import 'dart:async';
import 'package:avs/data/models/request.dart';
import 'package:avs/logic/cubits/map_cubit.dart';
import 'package:avs/logic/cubits/map_state.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen2 extends StatefulWidget {
  final Request request;

  const MapScreen2({@required this.request});

  @override
  _MapScreen2State createState() => _MapScreen2State();
}

class _MapScreen2State extends State<MapScreen2> {
  double latitude;
  double longitude;

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      latitude = widget.request.address.geo.coordinates[0];
      longitude = widget.request.address.geo.coordinates[1];
      placeMarker(latitude: latitude, longitude: longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MapCubit(widget.request, mapController)..checkLocationPermission(),
      child: Scaffold(
        body: Scaffold(
          body: BlocBuilder<MapCubit, MapState>(builder: (context, state) {
            return Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  markers: markers,
                  polylines: Set<Polyline>.of(state.polylines.values),
                  initialCameraPosition: _initialLocation,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
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
          }),
          bottomNavigationBar: BlocConsumer<MapCubit, MapState>(
            listener: (context, state) {
              if (state.hasError && state.hasPermission) {
                Scaffold.of(context)
                    .showSnackBar(AppSnackBar.error(state.errorMessage));
              } else if (state.hasError && !state.hasPermission) {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text('Location Permission Denied'),
                          content:
                              Text('Please enable permissions and try again'),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  print('clicked');
                                },
                                child: Text('Dismiss'))
                          ],
                        ),
                    barrierDismissible: false);
              }
            },
            builder: (context, state) {
              if (!state.hasPermission) {
                return SizedBox();
              } else {
                return state.hasArrived
                    ? _buildBottomButton(state, context)
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        height: 150,
                        child: Center(
                            child: Text(
                          'You need to be within 100 meters of Location to verify address',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        )),
                      );
              }
            },
          ),
        ),
      ),
    );
  }

  _buildBottomButton(state, context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 150,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: AppRaisedButton(
              height: 50,
              text: 'Verify Address',
              backgroundColor: AppColors.primaryColor,
              onPressed: (context) {
                BlocProvider.of<MapCubit>(context).handleClick(context);
              },
              // BlocProvider.of<MapCubit>(context).handleClick(context),
            ),
          ),
        ),
      ),
    );
  }

  //
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
      mapController.animateCamera(
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
}
