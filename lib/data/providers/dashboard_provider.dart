import 'package:avs/data/interceptor/api_interceptor.dart';
import 'package:avs/data/models/request.dart';
import 'package:dio/dio.dart';

import 'avs_api_client.dart';

class DashboardProvider {
  final _authCubit;
  final Dio _dio;

  DashboardProvider(this._authCubit, {Dio dio}) : _dio = dio ?? Dio();

  Future<int> getAssignedTotal() async {
    _dio.interceptors.add(ApiInterceptor(_authCubit));
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["authorization"] =
        "Bearer ${_authCubit.user.tokens.access.token}";

    var response = await _dio.get(baseUrl + '/requests/total?status=ASSIGNED');

    if (response.statusCode != 200) {
      return null;
    }

    return response.data['requests'];
  }

  Future<int> getCompletedTotal() async {
    _dio.interceptors.add(ApiInterceptor(_authCubit));
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["authorization"] =
        "Bearer ${_authCubit.user.tokens.access.token}";

    var response = await _dio.get(baseUrl + '/requests/total?status=COMPLETED');

    if (response.statusCode != 200) {
      return null;
    }

    return response.data['requests'];
  }

  Future<int> getTotalRequest() async {
    _dio.interceptors.add(ApiInterceptor(_authCubit));
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["authorization"] =
        "Bearer ${_authCubit.user.tokens.access.token}";

    var response = await _dio.get(baseUrl + '/requests/total?');

    if (response.statusCode != 200) {
      return null;
    }

    return response.data['requests'];
  }

  Future<List<Request>> getDashboardRequest() async {
    _dio.interceptors.add(ApiInterceptor(_authCubit));
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["authorization"] =
        "Bearer ${_authCubit.user.tokens.access.token}";

    final response = await _dio.get(baseUrl + '/requests?status=NEW&limit=5');
    if (response.statusCode != 200) {
      return null;
    }
    var body = response.data;
    var list = body['requests'] as List;
    return list.map((item) => Request.fromJson(item)).toList();
  }
}
