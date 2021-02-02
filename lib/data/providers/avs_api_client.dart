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
import 'package:avs/utils/constant_strings.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

final printAllResponses = true;

class ClientError implements Exception {
  ClientError(this.message);

  final String message;
}

// primary-agent@quickavs.ng
// System123!

final baseUrl = 'https://api-sandbox.quickavs.ng/v1';

class AVSApiClient {
  AVSApiClient({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Future<AddressUploadResponse> addAddress({String id, Address address}) async {
    print(jsonEncode(address.toRegisterRequestBody) + id);
    final response = await _httpClient.post(
      baseUrl + '/auth/local/register/address/agent/$id',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(address.toRegisterRequestBody),
    );

    if (printAllResponses) {
      log(response.body);
    }
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ClientError(
        StatusResponse.fromMap(jsonDecode(response.body))?.message ??
            response.reasonPhrase,
      );
    }
    try {
      return AddressUploadResponse.fromMap(jsonDecode(response.body));
    } catch (exception) {
      print(exception);
      throw ClientError('Something went wrong, please try again later');
    }
  }

  Future<String> verifyAddress({User user, ApiInterceptor2 interceptor}) async {
    log('fdfdfdfffd ...');

    final _dio = Dio()..interceptors.add(interceptor);

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
    final response = await _httpClient.post(
      baseUrl + '/auth/local/login',
      body: {"credential": email, "password": password},
    );

    if (printAllResponses) {
      log(response.body);
    }
    if (response.statusCode != 200) {
      throw ClientError(
        StatusResponse.fromMap(jsonDecode(response.body))?.message ??
            response.reasonPhrase,
      );
    }

    print(response.body);
    return LoginResponse.fromMap(jsonDecode(response.body))?.toSimpleUser;
  }

  Future<User> uploadUserInfo({User user}) async {
    print(jsonEncode(user.toRegisterRequestBody) + user.id);
    final response = await _httpClient.post(
      baseUrl + '/auth/local/register/agent/${user.id}',
      headers: {"Content-Type": "application/json"},
      body: (jsonEncode(user.toRegisterRequestBody)),
    );

    if (printAllResponses) {
      log(response.body);
    }
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ClientError(
        StatusResponse.fromMap(jsonDecode(response.body))?.message ??
            response.reasonPhrase,
      );
    }
    try {
      return RegistrationResponse.fromMap(jsonDecode(response.body))
          ?.toSimpleUser;
    } catch (exception) {
      print(exception);
      throw ClientError('Something went wrong, please try again later');
    }
  }

  Future<UploadFileResponse> uploadFile(String filePath) async {
    var dio = new Dio();
    dio.options.baseUrl = baseUrl;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath, filename: "upload.txt"),
    });

    final response = await dio.post("/utils/uploads", data: formData);

    if (printAllResponses) {
      log(jsonEncode(response.data));
    }
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ClientError(
        StatusResponse.fromMap(response.data)?.message ??
            response.statusMessage,
      );
    }
    try {
      return UploadFileResponse.fromMap(response.data);
    } catch (exception) {
      print(exception);
      throw ClientError('Something went wrong, please try again later');
    }
  }

  //6010850c8827c3002241341c
  Future<String> uploadDocs(String id, {dynamic body}) async {
    final response = await _httpClient.post(
      baseUrl + '/auth/local/register/upload/agent/$id',
      body: body,
    );

    if (printAllResponses) {
      log(response.body);
    }
    if (response.statusCode != 200) {
      throw ClientError(
        StatusResponse.fromMap(jsonDecode(response.body))?.message ??
            response.reasonPhrase,
      );
    }
    try {
      return jsonDecode(response.body)['message']?.toString();
    } catch (exception) {
      print(exception);
      throw ClientError('Something went wrong, please try again later');
    }
  }

  Future<String> setPassword({String mobile, String password}) async {
    print(mobile + password);
    final response = await _httpClient.post(
      baseUrl + '/agents/addPassword',
      body: {
        'mobile': mobile,
        'password': password,
      },
    );

    if (printAllResponses) {
      print(response.body);
    }
    if (response.statusCode != 200) {
      throw ClientError(
        StatusResponse.fromMap(jsonDecode(response.body))?.message ??
            response.reasonPhrase,
      );
    }
    return jsonDecode(response.body)['id']?.toString();
  }

  Future<StatusResponse> verifyOtp({String mobile, String code}) async {
    //print('sd$phoneNumber');
    final response = await _httpClient.post(
      baseUrl + '/auth/verify/otp/agent',
      body: {
        'mobile': mobile,
        'code': code,
      },
    );

    if (printAllResponses) {
      print(response.body);
    }
    if (response.statusCode != 200) {
      throw ClientError(
        StatusResponse.fromMap(jsonDecode(response.body))?.message ??
            response.reasonPhrase,
      );
    }

    return StatusResponse.fromMap(jsonDecode(response.body));
  }

  Future<StatusResponse> sendOtp(String mobile) async {
    //print('sd$mobile');
    final response = await _httpClient.post(
      baseUrl + '/auth/send/otp/agent',
      body: {
        'mobile': mobile,
      },
    );

    if (printAllResponses) {
      print(response.body);
    }
    if (response.statusCode != 200) {
      throw ClientError(
        StatusResponse.fromMap(jsonDecode(response.body))?.message ??
            response.reasonPhrase,
      );
    }
    return StatusResponse.fromMap(jsonDecode(response.body));
  }

  Future<Tokens> refreshTokens(Tokens tokens) async {
    ///Refresh call
    final response = await _httpClient.post('$baseUrl/auth/refresh-tokens',
        body: {"refreshToken": tokens.refresh.token});

    print(response);
    if (response.statusCode != 200) {
      ///Means request token is expired should log user out
      return null;
    }
    return Tokens.fromMap(json.decode(response.body));
  }
}
