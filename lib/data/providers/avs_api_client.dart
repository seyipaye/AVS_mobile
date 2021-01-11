import 'dart:convert';

import 'package:avs/data/models/status_response.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when locationSearch fails.
class SendOtpFailure implements Exception {
  SendOtpFailure(this.message);

  final message;
}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

class AVSApiClient {
  AVSApiClient({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://avs-staging-api.herokuapp.com/v1';
  final http.Client _httpClient;

  Future<StatusResponse> verifyOtp({String mobile, String code}) async {
    //print('sd$phoneNumber');
    final response = await _httpClient.post(
      _baseUrl + '/auth/send/otp/agent',
      body: {
        'mobile': mobile,
        'code': code,
      },
    );

    //print(response.body);
    if (response.statusCode != 200) {
      throw SendOtpFailure(response.reasonPhrase);
    }

    return StatusResponse.fromMap(jsonDecode(response.body));
  }

  Future<StatusResponse> sendOtp(String mobile) async {
    //print('sd$phoneNumber');
    final response = await _httpClient.post(
      _baseUrl + '/auth/send/otp/agent',
      body: {
        'mobile': mobile,
      },
    );

    //print(response.body);
    if (response.statusCode != 200) {
      throw SendOtpFailure(response.reasonPhrase);
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
