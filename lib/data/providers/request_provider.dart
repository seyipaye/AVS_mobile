import 'dart:convert';
import 'package:avs/data/models/request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestProvider {
  RequestProvider({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://api-sandbox.quickavs.ng/v1';
  final http.Client _httpClient;

  Future<List<Request>> getNewRequests(
    String token, {
    @required int page,
    @required int limit,
  }) async {
    final response = await _httpClient.get(
      _baseUrl + '/requests?page=${page.toString()}&status=NEW&limit=10',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode != 200) {
      return null;
    }
    var body = jsonDecode(response.body);
    var list = body['requests'] as List;
    return list.map((item) => Request.fromJson(item)).toList();
  }

  Future<List<Request>> getAssignedRequests(
    String token, {
    @required int page,
    @required int limit,
  }) async {
    final response = await _httpClient.get(
      _baseUrl + '/requests?page=$page&status=Assigned&limit=1',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode != 200) {
      return null;
    }
    var body = jsonDecode(response.body);
    var list = body['requests'] as List;
    return list.map((item) => Request.fromJson(item)).toList();
  }
}
