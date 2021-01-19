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
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDA0NTQ3NGRkMzZkODAwMmRmNDZhMWIiLCJ1c2VyIjp7ImF1dGhNZXRob2RzIjpbIkxPQ0FMIl0sImVtYWlsIjoicHJpbWFyeS1hZ2VudEBxdWlja2F2cy5uZyIsIm1vYmlsZSI6IjA4MDE5OTc5ODg3IiwidHlwZSI6IkFHRU5UIiwiY3JlYXRlZEF0IjoiMjAyMS0wMS0xN1QxNToxNTowMC42NjFaIiwidXBkYXRlZEF0IjoiMjAyMS0wMS0xN1QxNToxNTowMC42NjFaIiwiaWQiOiI2MDA0NTQ3NGRkMzZkODAwMmRmNDZhMWIiLCJleHRyYSI6eyJwcm9maWxlIjp7ImVtYWlsIjp7ImlzVmVyaWZpZWQiOnRydWUsImFkZHJlc3MiOiJwcmltYXJ5LWFnZW50QHF1aWNrYXZzLm5nIiwidmVyaWZpZWRPbiI6IjIwMjAtMTEtMjlUMDA6MDA6MDAuMDAwWiJ9LCJtb2JpbGUiOnsiaXNWZXJpZmllZCI6dHJ1ZSwibnVtYmVyIjoiMDgwMTk5Nzk4ODciLCJ2ZXJpZmllZE9uIjoiMjAyMC0xMS0yOVQwMDowMDowMC4wMDBaIn0sImZpcnN0TmFtZSI6IkphbWVzIiwibGFzdE5hbWUiOiJBZ3VzdG8iLCJvdGhlck5hbWUiOiJKb2huc29uIiwiaW1hZ2VVcmwiOiJodHRwczovL2kucHJhdmF0YXIuY2MvMzAwIiwiZ2VuZGVyIjoiTWFsZSJ9LCJwb3N0T2ZmaWNlIjp7InN0YXRlIjoiQWJpYSIsImxnYSI6IklrcG9iYS1Pa2hhIiwid2FyZCI6IldhcmQgQiJ9LCJhZGRyZXNzIjp7ImlzVmVyaWZpZWQiOnRydWUsInN0YXRlIjoiQmVudWUiLCJsZ2EiOiJLZWZmaSIsInBvc3RhbENvZGUiOiI4NDg5ODkiLCJzdHJlZXRBZGRyZXNzIjoiMjEwIENydWlja3NoYW5rIFBhdGgiLCJnZW8iOnsiY29vcmRpbmF0ZXMiOls2LjQ5NzE2NDgxLDMuMzMyNzM2MjldLCJ0eXBlIjoiUG9pbnQifSwidmVyaWZpZWRPbiI6IjIwMjAtMTEtMjlUMDA6MDA6MDAuMDAwWiJ9LCJzdGF0dXMiOiJBQ1RJVkFURUQiLCJ0eXBlIjoiTklQT1NUX1BPU1RNRU4iLCJ3YWxsZXRCYWxhbmNlIjowLCJ1c2VyIjoiNjAwNDU0NzRkZDM2ZDgwMDJkZjQ2YTFiIiwidWlkIjoia2sxYTZvd2xyNjF1eGQ1a2wyaSIsImNyZWF0ZWRBdCI6IjIwMjAtMDEtMjRUMDA6MDA6MDAuMDAwWiIsImhpc3RvcnkiOlt7Il9pZCI6IjYwMDQ1NDc3ZGQzNmQ4MDAyZGY0NmE2NiIsImV2ZW50IjoiVXNlciBSZWdpc3RlcmVkIiwiY3JlYXRlZEF0IjoiMjAyMC0xMS0yOVQwMDowMDowMC4wMDBaIiwidmFsdWUiOiJVc2VyIFJlZ2lzdGVyZWQiLCJjcmVhdGVkQnkiOiI2MDA0NTQ3NWRkMzZkODAwMmRmNDZhMmYifV0sImNyZWF0ZWRCeSI6IjYwMDQ1NDc1ZGQzNmQ4MDAyZGY0NmEyZiIsIklEIjpbXSwidXBkYXRlZEF0IjoiMjAyMC0wMS0yNFQwMDowMDowMC4wMDBaIiwiYWdlbnRJZCI6MywiaWQiOiI2MDA0NTQ3N2RkMzZkODAwMmRmNDZhNjUifX0sImlhdCI6MTYxMDkwODY0MiwiZXhwIjoxNjEzNTAwNjQyfQ.qzJAi5WKaqynSI7Lxliun3VbfP6G4lbTQAuVUHLUvZs';
  Future<List<Request>> getNewRequests({
    @required int page,
    @required int limit,
  }) async {
    final response = await _httpClient.get(
      _baseUrl + '/requests?page=$page',
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
