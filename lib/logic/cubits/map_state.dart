import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  MapState({
    this.position,
    this.polylines,
    this.hasPermission = false,
    this.errorMessage,
    this.hasArrived = false,
  });

  final bool hasArrived;
  final Map<PolylineId, Polyline> polylines;
  final bool hasPermission;
  final String errorMessage;
  final Position position;

  bool get hasError => errorMessage != null;

  MapState copyWith(
      {final bool hasArrived,
      final bool hasPermission,
      final String errorMessage,
      final Map<PolylineId, Polyline> polylines,
      final Position position}) {
    return MapState(
        hasArrived: hasArrived ?? this.hasArrived,
        hasPermission: hasPermission ?? this.hasPermission,
        errorMessage: errorMessage ?? null,
        position: position ?? this.position,
        polylines: polylines ?? this.polylines);
  }

  List<Object> get props =>
      [hasArrived, hasPermission, errorMessage, polylines];
}
