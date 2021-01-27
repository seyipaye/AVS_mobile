import 'package:avs/data/models/request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DashBoardState extends Equatable {}

class InitState extends DashBoardState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends DashBoardState {
  @override
  List<Object> get props => [];
}

class LoadedState extends DashBoardState {
  final List<Request> list;
  final int assignedTotal;
  final int completedTotal;
  final int requestTotal;

  LoadedState(
      {@required this.list,
      @required this.assignedTotal,
      @required this.completedTotal,
      @required this.requestTotal});

  @override
  List<Object> get props => [];
}

class ErrorState extends DashBoardState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object> get props => [error];
}
