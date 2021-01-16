import 'dart:convert';

import 'package:avs/data/models/request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestProvider {
  RequestProvider({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://avs-staging-api.herokuapp.com/v1';
  final http.Client _httpClient;

  Future<List<Request>> getNewRequests({
    @required int page,
    @required int limit,
  }) async {
    final response = await _httpClient.get(
      _baseUrl + '/requests?status=NEW&hide=true&page=$page',
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode != 200) {
      return null;
    }
    var list = jsonDecode(response.body)['request'] as List;
    return list.map((item) => Request.fromJson(item)).toList();
  }
}
