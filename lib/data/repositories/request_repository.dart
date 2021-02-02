import 'package:avs/data/models/document.dart';
import 'package:avs/data/models/request.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/data/providers/request_provider.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/screens/process_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RequestRepository {
  static RequestRepository _instance;

  RequestRepository._internal(this.authCubit)
      : this.provider = RequestProvider(authCubit) {
    _instance = this;
  }

  factory RequestRepository(AuthenticationCubit authCubit) =>
      _instance ?? RequestRepository._internal(authCubit);

  /* RequestRepository(this.authCubit)
      : this.provider = RequestProvider(authCubit);*/

  final AuthenticationCubit authCubit;
  final RequestProvider provider;
  static const int _perPage = 10;

  Future<List<Request>> getNewRequests(
      {@required int page, int limit = _perPage}) async {
    return await provider.getNewRequests(page: page, limit: limit);
  }

  Future<List<Request>> getAssignedRequests(
      {@required int page, int limit = _perPage}) async {
    return await provider.getAssignedRequests(page: page, limit: limit);
  }

  Future<String> acceptRequest({String id}) {
    return provider.acceptRequest(id: id);
  }

  Future<String> rejectRequest({String id}) {
    return provider.rejectRequest(id: id);
  }

  Future<String> processRequest({
    String id,
    AddressStatus status,
    Position position,
    final List<String> reasons,
    final String assessment,
    final List<Document> images,
  }) async {
    // Upload images
    final String imageUrl =
        await AVSApiClient().uploadFile(images.first.value).then((value) {
      return value.imageUrls.first;
    });

    return provider.processRequest(id: id, data: {
      "notes": assessment,
      "signature": "bsufheiwfnkewih",
      "geotag": {
        "lat": position.longitude.toString(),
        "long": position.longitude.toString()
      },
      "images": [imageUrl],
      "verified": status == AddressStatus.Approved
    });
  }
}
