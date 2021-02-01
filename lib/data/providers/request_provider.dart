import 'dart:developer';

import 'package:avs/data/api_responses/status_response.dart';
import 'package:avs/data/interceptor/api_interceptor2.dart';
import 'package:avs/data/models/request.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/utils/constant_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'avs_api_client.dart';

class RequestProvider {
  RequestProvider(this._authCubit)
      : _dio = Dio()..interceptors.add(ApiInterceptor2(_authCubit));

  final Dio _dio;
  final AuthenticationCubit _authCubit;

  Future<String> acceptRequest({
    @required String id,
  }) async {
    //log(id);
    return _dio.post(baseUrl + '/requests/assign/' + id,
        options: Options(headers: {requiresToken: true}),
        data: {"status": "ACCEPTED"}).then((response) {
      return StatusResponse.fromMap(response.data).message ??
          response.statusMessage;
    });
  }

  Future<String> rejectRequest({
    @required String id,
  }) async {
    //log(id);
    return _dio.post(baseUrl + '/requests/assign/' + id,
        options: Options(headers: {requiresToken: true}),
        data: {"status": "REJECTED"}).then((response) {
      return StatusResponse.fromMap(response.data).message ??
          response.statusMessage;
    });
  }

  Future<String> processRequest({
    @required String id,
    dynamic data,
  }) async {
    //log(id);
    return _dio
        .post(baseUrl + '/requests/process/' + id,
            options: Options(headers: {requiresToken: true}), data: data)
        .then((response) {
      return StatusResponse.fromMap(response.data).message ??
          response.statusMessage;
    });
  }

  Future<List<Request>> getNewRequests({
    @required int page,
    @required int limit,
  }) async {
    final response = await _dio.get(
        baseUrl + '/requests?page=${page.toString()}&status=NEW&limit=$limit',
        options: Options(headers: {requiresToken: true}));
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
    final response = await _dio.get(
        baseUrl +
            '/requests?page=${page.toString()}&status=ASSIGNED&limit=$limit',
        options: Options(headers: {requiresToken: true}));
    if (response.statusCode != 200) {
      return null;
    }
    var body = response.data;
    var list = body['requests'] as List;
    return list.map((item) => Request.fromJson(item)).toList();
  }
}
