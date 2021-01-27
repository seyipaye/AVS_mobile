import 'package:avs/data/models/request.dart';
import 'package:avs/data/providers/dashboard_provider.dart';

class DashboardRepository {
  final DashboardProvider provider;

  DashboardRepository(this.provider);

  Future<int> getAssignedTotal() async {
    return provider.getAssignedTotal();
  }

  Future<int> getCompletedTotal() async {
    return provider.getCompletedTotal();
  }

  Future<int> getTotalRequest() async {
    return provider.getTotalRequest();
  }

  Future<List<Request>> getDashboardRequests() async {
    return provider.getDashboardRequest();
  }
}
