import 'package:avs/data/repositories/dashboard_repository.dart';
import 'package:avs/logic/cubits/dashboard_state.dart';
import 'package:bloc/bloc.dart';

class DashboardCubit extends Cubit<DashBoardState> {
  final DashboardRepository repository;

  DashboardCubit({this.repository}) : super(InitState()) {
    fetchData();
  }

  Future<void> fetchData() async {
    emit(LoadingState());
    var totalAssigned = await repository.getAssignedTotal();
    var totalCompleted = await repository.getCompletedTotal();
    var totalRequest = await repository.getTotalRequest();
    var list = await repository.getDashboardRequests();
    if (totalRequest != null &&
        totalAssigned != null &&
        totalCompleted != null) {
      emit(LoadedState(
          list: list,
          assignedTotal: totalAssigned,
          completedTotal: totalCompleted,
          requestTotal: totalRequest));
    } else {
      emit(ErrorState('Something went wrong'));
    }
  }
}
