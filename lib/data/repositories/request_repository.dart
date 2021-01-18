import 'package:avs/data/models/request.dart';
import 'package:avs/data/providers/request_provider.dart';
import 'package:flutter/material.dart';

class RequestRepository {
  final provider = RequestProvider();
  static const int _perPage = 10;

  Future<List<Request>> getNewRequests(
      {@required int page, int limit = _perPage}) async {
    return await provider.getNewRequests(page: page, limit: limit);
  }
}
