import 'package:avs/data/models/request.dart';
import 'package:avs/data/providers/request_provider.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:flutter/material.dart';

class RequestRepository {
  final RequestProvider provider;
  static const int _perPage = 10;

  RequestRepository(this.provider);

  Future<List<Request>> getNewRequests(
      {@required int page, int limit = _perPage}) async {
    return await provider.getNewRequests(page: page, limit: limit);
  }

  Future<List<Request>> getAssignedRequests(
      {@required int page, int limit = _perPage}) async {
    return await provider.getAssignedRequests(page: page, limit: limit);
  }
}
