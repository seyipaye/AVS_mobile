import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:avs/data/api_responses/address_upload_response.dart';
import 'package:avs/data/api_responses/login_response.dart';
import 'package:avs/data/api_responses/status_response.dart';
import 'package:avs/data/api_responses/upload_file_response.dart';
import 'package:avs/data/api_responses/registration_response.dart';
import 'package:avs/data/interceptor/api_interceptor2.dart';
import 'package:avs/data/models/address.dart';
import 'package:avs/data/models/tokens.dart';
import 'package:avs/data/models/user.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/utils/constant_strings.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'avs_api_client.dart';

final printAllResponses = true;

// primary-agent@quickavs.ng
// System123!

final baseUrl = 'https://api-sandbox.quickavs.ng/v1';

class AuthenticationProvider {
  AuthenticationProvider(this._authCubit)
      : _dio = Dio()..interceptors.add(ApiInterceptor2(_authCubit));

  final Dio _dio;
  final AuthenticationCubit _authCubit;

  Future<AddressUploadResponse> addAddress({String id, Address address}) async {
    print(jsonEncode(address.toRegisterRequestBody) + id);

    return _dio
        .post(
      baseUrl + '/auth/local/register/address/agent/$id',
      data: address.toRegisterRequestBody,
    )
        .then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return AddressUploadResponse.fromMap(response.data);
    });
  }

  Future<String> verifyAddress({User user, ApiInterceptor2 interceptor}) async {
    log('fdfdfdfffd ...');

    return _dio
        .post(
      baseUrl + '/agents/verifyAddress/' + user.id,
      data: {"status": "VERIFY"},
      options: Options(headers: {requiresToken: true}),
    )
        .then((response) {
      if (printAllResponses) {
        log(' fdfdf ${jsonEncode(response.data)}');
      }

      return StatusResponse.fromMap(response.data).message ??
          response.statusMessage;
    });
  }

  Future<User> login(String email, String password) async {
    print('$email...$password');
    return _dio.post(
      baseUrl + '/auth/local/login',
      data: {"credential": email, "password": password},
    ).then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return LoginResponse.fromMap(response.data)?.toSimpleUser;
    });
  }

  Future<User> uploadUserInfo({User user}) async {
    print(jsonEncode(user.toRegisterRequestBody) + user.id);
    return _dio
        .post(
      baseUrl + '/auth/local/register/agent/${user.id}',
      //headers: {"Content-Type": "application/json"},
      data: user.toRegisterRequestBody,
    )
        .then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return RegistrationResponse.fromMap(response.data)?.toSimpleUser;
    });
  }

  Future<UploadFileResponse> uploadFile(String filePath) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath, filename: "upload.txt"),
    });

    return _dio.post("/utils/uploads", data: formData).then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return UploadFileResponse.fromMap(response.data);
    });
  }

  //6010850c8827c3002241341c
  Future<String> uploadDocs(String id, {dynamic body}) async {
    return _dio
        .post(
      baseUrl + '/auth/local/register/upload/agent/$id',
      data: body,
    )
        .then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return StatusResponse.fromMap(response.data)?.message;
    });
  }

  Future<String> setPassword({String mobile, String password}) async {
    print(mobile + password);
    return _dio.post(
      baseUrl + '/agents/addPassword',
      data: {
        'mobile': mobile,
        'password': password,
      },
    ).then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return jsonDecode(response.data)['id']?.toString();
    });
  }

  Future<StatusResponse> verifyOtp({String mobile, String code}) async {
    //print('sd$phoneNumber');
    return _dio.post(
      baseUrl + '/auth/verify/otp/agent',
      data: {
        'mobile': mobile,
        'code': code,
      },
    ).then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return StatusResponse.fromMap(jsonDecode(response.data));
    });
  }

  Future<StatusResponse> sendOtp(String mobile) async {
    //print('sd$mobile');
    return _dio.post(
      baseUrl + '/auth/send/otp/agent',
      data: {
        'mobile': mobile,
      },
    ).then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return StatusResponse.fromMap(response.data);
    });
  }

  Future<Tokens> refreshTokens(Tokens tokens) async {
    ///Refresh call
    return _dio.post('$baseUrl/auth/refresh-tokens',
        data: {"refreshToken": tokens.refresh.token}).then((response) {
      if (printAllResponses) {
        log(response.data);
      }
      return Tokens.fromMap(response.data);
    });
  }
}
