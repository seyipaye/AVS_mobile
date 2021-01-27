import 'dart:convert';
import 'package:avs/data/interceptor/api_interceptor.dart';
import 'package:avs/data/models/request.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestProvider {
  RequestProvider(this._authCubit, {Dio dio}) : _dio = dio ?? Dio();

  final Dio _dio;
  final AuthenticationCubit _authCubit;

  static const _baseUrl = 'https://api-sandbox.quickavs.ng/v1';

  Future<List<Request>> getNewRequests({
    @required int page,
    @required int limit,
  }) async {
    _dio.interceptors.add(ApiInterceptor(_authCubit));
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["authorization"] =
        "Bearer ${_authCubit.user.tokens.access.token}";
    final response = await _dio.get(
        _baseUrl + '/requests?page=${page.toString()}&status=NEW&limit=$limit');
    if (response.statusCode != 200) {
      return null;
    }
    var body = response.data;
    var list = body['requests'] as List;
    return list.map((item) => Request.fromJson(item)).toList();
  }

  Future<List<Request>> getAssignedRequests({
    @required int page,
    @required int limit,
  }) async {
    print(_authCubit.user.toJson());
    _dio.interceptors.add(ApiInterceptor(_authCubit));
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["authorization"] =
        "Bearer ${_authCubit.user.tokens.access.token}";
    final response = await _dio.get(_baseUrl +
        '/requests?page=${page.toString()}&status=ASSIGNED&limit=$limit');
    if (response.statusCode != 200) {
      return null;
    }
    var body = response.data;
    var list = body['requests'] as List;
    return list.map((item) => Request.fromJson(item)).toList();
  }
}
