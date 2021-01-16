import 'package:avs/data/models/request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestProvider {
  RequestProvider({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://avs-staging-api.herokuapp.com/v1';
  final http.Client _httpClient;

  Future<Request> getNewRequests({
    @required int page,
    @required int limit,
  }) async {
    final response = await _httpClient.get(
      _baseUrl + '/requests?status=NEW&hide=true&limit=$limit&page=$page',
      headers: {"Content-Type": "application/json"},
    );
  }
}
