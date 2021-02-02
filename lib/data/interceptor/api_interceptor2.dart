import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:avs/data/api_responses/status_response.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/utils/constant_strings.dart';
import 'package:dio/dio.dart';

class ApiInterceptor2 extends Interceptor {
  final AuthenticationCubit authCubit;
  final Dio dio = Dio();

  ApiInterceptor2(this.authCubit);

  // @override
  // Future onResponse(Response response) async {
  //   if (response.statusCode == 401) {
  //     await authCubit.refreshTokens();
  //     return await dio.request(response.request.path,
  //         options: Options(
  //             headers: {'Authentication': authCubit.user.tokens.access.token}));
  //   }
  //   return response;
  // }

  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey(requiresToken)) {
      // Remove the auxiliary header
      options.headers.remove(requiresToken);

      // Add token
      String token = authCubit.user.tokens.access.token;

      options.headers
          .addAll({HttpHeaders.authorizationHeader: 'Bearer $token'});

      //print('used ${options.headers}');
      return options;
    }
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) async {
    if (err.response != null) {
      print('xsmnkn  ${err.response.data}');
      if (err.response.statusCode == 401) {
        if (await authCubit.refreshTokens()) {
          RequestOptions options = err.response.request;
          options.headers["Authorization"] =
              "Bearer " + authCubit.user.tokens.access.token;
          return dio.request(options.path, options: options);
        }
      }
      return StatusResponse.fromMap(err.response.data)?.message ??
          err.response.statusMessage;
    } else {
      if (err.response != null) {
        print('pure Error  ${err.response.data}');
      }
      return err;
    }
  }
}
