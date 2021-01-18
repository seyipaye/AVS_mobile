import 'package:avs/data/models/request.dart';
import 'package:avs/data/repositories/request_repository.dart';
import 'package:avs/logic/bloc/request_bloc_states.dart';
import 'package:bloc/bloc.dart';

///Events
class RequestEvent {}

class RequestBloc extends Bloc<RequestEvent, RequestsBlocState> {
  final RequestRepository _repository;
  int page = 1;
  bool isLoading = false;
  List<Request> requestList = [];

  RequestBloc(this._repository) : super(RequestsInitialState());

  @override
  Stream<RequestsBlocState> mapEventToState(RequestEvent event) async* {
    if (event is RequestEvent && isLoading == false) {
      yield RequestsLoadingState(message: "Loading Requests");
      isLoading = true;
      final List<Request> requests =
          await _repository.getNewRequests(page: page);
      if (requests != null && requests.isNotEmpty) {
        requestList.addAll(requests);
        yield RequestsSuccessState();
        print(page);
        page++;
        isLoading = false;
      } else if (requests.isEmpty) {
        isLoading = false;
        yield RequestsErrorState(error: 'Pages exceeded');
      } else
        yield RequestsErrorState(error: 'List is null');
    }
  }
}