import 'dart:io';
// import 'package:socket_io/socket_io.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:avs/data/database/database.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:avs/data/database/database.dart';
import 'package:avs/data/models/request.dart';
import 'package:avs/data/repositories/request_repository.dart';
import 'package:avs/logic/bloc/request_bloc_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

///Events
class RequestEvent {}

class NewRequestEvent extends RequestEvent {}

class AssignedRequestEvent extends RequestEvent {}

class RequestBloc extends Bloc<RequestEvent, RequestsBlocState> {
  final RequestRepository _repository;

  int page = 1;
  bool isLoading = false;
  List<Request> requestList = [];

  RequestBloc(this._repository) : super(RequestsInitialState()) {
    addSocket();
  }

  @override
  Stream<RequestsBlocState> mapEventToState(RequestEvent event) async* {
    ///Pagination For New Requests
    if (event is NewRequestEvent && isLoading == false) {
      try {
        yield RequestsLoadingState(message: "Loading Requests");
        isLoading = true;
        final List<Request> requests =
            await _repository.getNewRequests(page: page);
        if (requests != null) {
          if (requests.isNotEmpty) {
            requestList.addAll(requests);
            yield RequestsSuccessState();
            page++;
            isLoading = false;
          }
          isLoading = false;
        } else if (requests != null && requests.isEmpty) {
          isLoading = false;
          yield RequestsErrorState(error: 'Pages exceeded');
        } else
          yield RequestsErrorState(error: 'List is null');
      } catch (e) {
        print(e);
        yield RequestsErrorState(error: 'Unable to connect');
        print('ran');
      }
    }

    /// Pagination For Assigned Requests
    else if (event is AssignedRequestEvent && isLoading == false) {
      try {
        yield RequestsLoadingState(message: "Loading Requests");
        isLoading = true;
        final List<Request> requests =
            await _repository.getAssignedRequests(page: page);
        if (requests != null && requests.isNotEmpty) {
          requestList.addAll(requests);
          yield RequestsSuccessState();

          ///Save Data offline
          saveForOffline(requests, page);

          ///Increment page
          page++;
          isLoading = false;
        } else if (requests != null && requests.isEmpty) {
          isLoading = false;
          yield RequestsErrorState(error: 'Pages exceeded');
        } else
          yield RequestsErrorState(error: 'List is null');
      } catch (e) {
        print(e);
        if (e is DioError) {
          if (e.error is SocketException) {
            yield RequestsErrorState(
                error: 'Unable to fetch requests please check connection');
            if (requestList.isEmpty) {
              var list = await DBProvider.db.getAssignedRequests();
              list.forEach((element) {
                print(element.address.geo.coordinates);
              });
              requestList.addAll(list);
              yield RequestsSuccessState();
            }
          }
        }
      }
    }
  }

  Future<void> addSocket() async {
    try {
      SocketIOManager manager = SocketIOManager();
      var options = SocketOptions('https://api-sandbox.quickavs.ng');
      SocketIO socket = await manager.createInstance(options);
      socket.onConnect((data) {
        print("connected...");
        //socket.emit("message", ["Hello world!"]);
      });
      socket.on("created requestCreated", (data) {
        requestList.clear();
        page = 1;
        this.add(NewRequestEvent());
      });

      socket.on("requestAgentAccepted", (data) {
        print('accepted triggered');
        requestList.clear();
        page = 1;
        this.add(NewRequestEvent());
      });
      socket.connect();
      var status = await socket.isConnected();
      print('this is connection $status');
    } catch (e) {
      print(e);
    }
  }

  ///Save data offline
  Future<void> saveForOffline(List<Request> requests, int page) async {
    print('save for offline');
    if (page == 1) {
      ///Clear out db for incoming data
      await DBProvider.db.dropRequestTable();
    }
    requests.forEach((request) async {
      var res = await DBProvider.db.addRequest(request.toJson());
      print(res);
    });
    var list = await DBProvider.db.getAssignedRequests();
    print(list);
  }

  Future<List<Request>> getFromLocal() async {
    return await DBProvider.db.getAssignedRequests();
  }
}
