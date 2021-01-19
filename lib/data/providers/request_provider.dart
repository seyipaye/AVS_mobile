import 'dart:convert';
import 'package:avs/data/models/request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestProvider {
  RequestProvider({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://api-sandbox.quickavs.ng/v1';
  final http.Client _httpClient;
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDA3MmRkMmIxNGY3YjAwMmM4M2VmMzIiLCJ1c2VyIjp7ImF1dGhNZXRob2RzIjpbIkxPQ0FMIl0sImVtYWlsIjoicHJpbWFyeS1hZ2VudEBxdWlja2F2cy5uZyIsIm1vYmlsZSI6IjA4MDk1MzI3NjUwIiwidHlwZSI6IkFHRU5UIiwiY3JlYXRlZEF0IjoiMjAyMS0wMS0xOVQxOTowNjo1OC4xMjZaIiwidXBkYXRlZEF0IjoiMjAyMS0wMS0xOVQxOTowNjo1OC4xMjZaIiwiaWQiOiI2MDA3MmRkMmIxNGY3YjAwMmM4M2VmMzIiLCJleHRyYSI6eyJwcm9maWxlIjp7ImVtYWlsIjp7ImlzVmVyaWZpZWQiOnRydWUsImFkZHJlc3MiOiJwcmltYXJ5LWFnZW50QHF1aWNrYXZzLm5nIiwidmVyaWZpZWRPbiI6IjIwMjAtMTEtMjlUMDA6MDA6MDAuMDAwWiJ9LCJtb2JpbGUiOnsiaXNWZXJpZmllZCI6dHJ1ZSwibnVtYmVyIjoiMDgwOTUzMjc2NTAiLCJ2ZXJpZmllZE9uIjoiMjAyMC0xMS0yOVQwMDowMDowMC4wMDBaIn0sImZpcnN0TmFtZSI6IlJlYmVjY2EiLCJsYXN0TmFtZSI6IkZvcmQiLCJvdGhlck5hbWUiOiJGb3JkIiwiaW1hZ2VVcmwiOiJodHRwczovL2kucHJhdmF0YXIuY2MvMzAwIiwiZ2VuZGVyIjoiTWFsZSJ9LCJhZGRyZXNzIjp7ImlzVmVyaWZpZWQiOnRydWUsInN0YXRlIjoiS2F0c2luYSIsImxnYSI6Ik9zZSIsInBvc3RhbENvZGUiOiIxNzYxOTYiLCJzdHJlZXRBZGRyZXNzIjoiMTM0NTggUHJlZG92aWMgTW90b3J3YXkiLCJnZW8iOnsiY29vcmRpbmF0ZXMiOls2LjQ5NzE2NDgxLDMuMzMyNzM2MjldLCJ0eXBlIjoiUG9pbnQifSwidmVyaWZpZWRPbiI6IjIwMjAtMTEtMjlUMDA6MDA6MDAuMDAwWiJ9LCJzdGF0dXMiOiJBQ1RJVkFURUQiLCJ0eXBlIjoiSU5EX0FHRU5UIiwid2FsbGV0QmFsYW5jZSI6MCwidXNlciI6IjYwMDcyZGQyYjE0ZjdiMDAyYzgzZWYzMiIsImNyZWF0ZWRBdCI6IjIwMjAtMDktMTBUMDA6MDA6MDAuMDAwWiIsImhpc3RvcnkiOlt7Il9pZCI6IjYwMDcyZGQ0YjE0ZjdiMDAyYzgzZWY3ZCIsImV2ZW50IjoiVXNlciBSZWdpc3RlcmVkIiwiY3JlYXRlZEF0IjoiMjAyMC0xMS0yOVQwMDowMDowMC4wMDBaIiwidmFsdWUiOiJVc2VyIFJlZ2lzdGVyZWQiLCJjcmVhdGVkQnkiOiI2MDA3MmRkMmIxNGY3YjAwMmM4M2VmNDYifV0sImNyZWF0ZWRCeSI6IjYwMDcyZGQyYjE0ZjdiMDAyYzgzZWY0NiIsIklEIjpbXSwicmVxdWVzdHNSZWplY3RlZCI6W10sInVwZGF0ZWRBdCI6IjIwMjAtMDktMTBUMDA6MDA6MDAuMDAwWiIsImFnZW50SWQiOjMsImlkIjoiNjAwNzJkZDRiMTRmN2IwMDJjODNlZjdjIn19LCJpYXQiOjE2MTEwOTE0NzgsImV4cCI6MTYxMTA5MzI3OH0.tD9wxEoK5bDAAL0kywekZWt85TJpxtLg7OGdDPlHJA0';
  Future<List<Request>> getNewRequests({
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

  Future<List<Request>> getAssignedRequests({
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
