import 'dart:async';

import 'package:avs/data/api_responses/address_upload_response.dart';
import 'package:avs/data/api_responses/status_response.dart';
import 'package:avs/data/interceptor/api_interceptor2.dart';
import 'package:avs/data/models/address.dart';
import 'package:avs/data/models/document.dart';
import 'package:avs/data/models/shared_pref.dart';
import 'package:avs/data/models/tokens.dart';
import 'package:avs/data/models/user.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';

class UserRepository {
  //final userDao = UserDao();
  final apiClient = AVSApiClient();
  final prefs = SharedPref();

  Future<User> login({String email, String password}) async {
    return apiClient.login(email, password).then((user) async {
      await saveUser(user: user);
      return user;
    });
  }

  Future<User> uploadUserInfo({User user}) async {
    return apiClient.uploadUserInfo(user: user);
  }

  Future saveUser({User user}) async {
    return prefs.save('USER', user.toJson());
  }

  Future<AddressUploadResponse> addAddress({String id, Address address}) async {
    return apiClient.addAddress(id: id, address: address);
  }

  Future<String> verifyAddress(AuthenticationCubit authCubit) async {
    return apiClient.verifyAddress(
        user: authCubit.user, interceptor: ApiInterceptor2(authCubit));
  }

  Future<String> uploadDocs(User user, {String photoPath, Document doc}) async {
    //'https://api-sandbox.quickavs.ng/v1/files/XhCvmR8cM3cu0vg7HKCe.bin/get';
    final String photoUrl = await apiClient.uploadFile(photoPath).then((value) {
      return value.imageUrls.first;
    });

    print(user.id);

    if (doc.type == DocumentType.NIN) {
      return apiClient.uploadDocs(
        user.id,
        body: {
          "imageUrl": photoUrl,
          "number": doc.value,
          "type": doc.backendType
        },
      );
    } else {
      //'https://api-sandbox.quickavs.ng/v1/files/BL32YUjZGxoxiu3IMQrY.bin/get';
      final String docUrl = await apiClient.uploadFile(doc.value).then((value) {
        return value.imageUrls.first;
      });

      return apiClient.uploadDocs(
        user.id,
        body: {
          "imageUrl": photoUrl,
          "documentUrl": docUrl,
          "type": doc.backendType
        },
      );
    }
  }

  Future<String> setPassword({String mobile, String password}) {
    return apiClient.setPassword(mobile: mobile, password: password);
  }

  Future<StatusResponse> verifyOtp({String mobile, String code}) {
    return apiClient.verifyOtp(mobile: mobile, code: code);
  }

  Future<StatusResponse> sendOtp(String mobile) {
    return apiClient.sendOtp(mobile);
  }

  Future<User> getUser() async {
    await Future<User>.delayed(const Duration(seconds: 2));
    var json = await SharedPref().read('USER');
    //return
    if (json != null) {
      return User.fromMap(json);
    }
    return null;
  }

  ///Function to refresh the request
  Future<Tokens> refreshTokens(Tokens tokens) async {
    return apiClient.refreshTokens(tokens);
  }

  Future<void> logUserOut() async {
    await prefs.remove('USER');
  }
}
