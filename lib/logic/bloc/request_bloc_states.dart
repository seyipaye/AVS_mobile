import 'package:avs/data/models/request.dart';
import 'package:equatable/equatable.dart';

abstract class RequestsBlocState extends Equatable {}

class RequestsInitialState extends RequestsBlocState {
  @override
  List<Object> get props => [];
}

class RequestsLoadingState extends RequestsBlocState {
  final String message;

  RequestsLoadingState({this.message});

  @override
  List<Object> get props => [message];
}

class RequestsSuccessState extends RequestsBlocState {
  final List<Request> requests;

  RequestsSuccessState(this.requests);

  @override
  List<Object> get props => [requests];
}

class RequestsErrorState extends RequestsBlocState {
  final String error;

  RequestsErrorState({this.error});
  @override
  List<Object> get props => [error];
}
