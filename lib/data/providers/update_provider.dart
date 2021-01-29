import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UpdateProvider {
  final AuthenticationCubit _authCubit;
  final Dio _dio;

  static const _baseUrl = 'https://api-sandbox.quickavs.ng/v1';

  UpdateProvider(this._authCubit, {Dio dio}) : _dio = dio ?? Dio();

  Future<void> updatePassword(
      {@required oldPassword, @required newPassword}) async {
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["authorization"] =
        "Bearer ${_authCubit.user.tokens.access.token}";

    var response = await _dio.post(_baseUrl + '/auth/update-password', data: {
      'email': _authCubit.user.email.address,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    });
    return;
  }
}
