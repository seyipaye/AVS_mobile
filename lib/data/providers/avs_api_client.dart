import 'dart:convert';
import 'dart:developer';

import 'package:avs/data/api_responses/login_response.dart';
import 'package:avs/data/api_responses/status_response.dart';
import 'package:avs/data/api_responses/user_response.dart';
import 'package:avs/data/models/user.dart';
import 'package:http/http.dart' as http;

final printAllResponses = true;

/// Exception thrown when locationSearch fails.
class SendOtpFailure implements Exception {
  SendOtpFailure(this.message);

  final message;
}

class ClientError implements Exception {
  ClientError(this.message);

  final String message;
}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

// primary-agent@quickavs.ng
// System123!

class AVSApiClient {
  AVSApiClient({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://api-sandbox.quickavs.ng/v1';
  final http.Client _httpClient;

  Future<User> login(String email, String password) async {
    final response = await _httpClient.post(
      _baseUrl + '/auth/local/agent/login',
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

    return LoginResponse.fromMap(jsonDecode(response.body))?.toSimpleUser;
  }

  Future<User> setUser({User user}) async {
    print(jsonEncode(user.toRegisterRequestBody) + user.id);
    final response = await _httpClient.post(
      _baseUrl + '/auth/local/register/agent/${user.id}',
      headers: {"Content-Type": "application/json"},
      body: (jsonEncode(user.toRegisterRequestBody)),
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
      return RegistrationResponse.fromMap(jsonDecode(response.body))
          ?.toSimpleUser;
    } catch (exception) {
      print(exception);
      throw ClientError('Something went wrong, please try again later');
    }
  }

  Future<String> setPassword({String mobile, String password}) async {
    print(mobile + password);
    final response = await _httpClient.post(
      _baseUrl + '/agents/addPassword',
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
      _baseUrl + '/auth/verify/otp/agent',
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
      _baseUrl + '/auth/send/otp/agent',
      body: {
        'mobile': mobile,
      },
    );

    print(response);
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

    /*final responseJson = jsonDecode(
      response.body,
    ) as List;
    return weatherJson?.isNotEmpty == true
        ? Weather.fromJson(weatherJson.first as Map<String, dynamic>)
        : null;

    final locationJson = jsonDecode(
      response.body,
    ) as List;
    return locationJson?.isNotEmpty == true
        ? Location.fromJson(locationJson.first as Map<String, dynamic>)
        : null;*/
  }

  /*/// Finds a [Location] `/api/location/search/?query=(query)`.
  Future<Location> locationSearch(String query) async {
    final locationRequest = Uri.https(_baseUrl, '/api/location/search', {
      'query': query,
    });
    final locationResponse = await _httpClient.get(locationRequest);

    if (locationResponse.statusCode != 200) {
      throw LocationIdRequestFailure();
    }

    final locationJson = jsonDecode(
      locationResponse.body,
    ) as List;
    return locationJson?.isNotEmpty == true
        ? Location.fromJson(locationJson.first as Map<String, dynamic>)
        : null;
  }*/

  /* /// Fetches [Weather] for a given [locationId].
  Future<Weather> getWeather(int locationId) async {
    final weatherRequest = Uri.https(_baseUrl, '/api/location/$locationId');
    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final weatherJson = jsonDecode(
      weatherResponse.body,
    )['consolidated_weather'] as List;
    return weatherJson?.isNotEmpty == true
        ? Weather.fromJson(weatherJson.first as Map<String, dynamic>)
        : null;
  }*/
}
