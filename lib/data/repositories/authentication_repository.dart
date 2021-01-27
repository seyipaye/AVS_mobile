import 'dart:async';

import 'package:avs/data/api_responses/status_response.dart';
import 'package:avs/data/models/address.dart';
import 'package:avs/data/models/document.dart';
import 'package:avs/data/models/shared_pref.dart';
import 'package:avs/data/models/tokens.dart';
import 'package:avs/data/models/user.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  //final userDao = UserDao();
  final apiClient = AVSApiClient();
  final prefs = SharedPref();

  Future<User> login({String email, String password}) async {
    return apiClient.login(email, password);
  }

  Future<User> setUser({User user}) async {
    await prefs.save('USER', user.toJson());
    print('code ran');
    return Future.delayed(Duration(seconds: 2)).then((value) => user);

//     //return Future.delayed(Duration(seconds: 2)).then((value) => user);
//     //await prefs.save('User', user);
//
//     return apiClient.setUser(user: user);
  }

  Future<String> addAddress({User user, Address address}) async {
    //return Future.delayed(Duration(seconds: 2)).then((value) => user);
    //await prefs.save('User', user);

    return apiClient.addAddress(user: user, address: address);
  }

  Future<String> uploadDocs(User user, {String photoPath, Document doc}) async {
    //return Future.delayed(Duration(seconds: 2)).then((value) => user);
    //await prefs.save('User', user);

    //'https://api-sandbox.quickavs.ng/v1/files/XhCvmR8cM3cu0vg7HKCe.bin/get';
    final String photoUrl = await apiClient.uploadFile(photoPath).then((value) {
      return value.imageUrls.first;
    });

    //'https://api-sandbox.quickavs.ng/v1/files/BL32YUjZGxoxiu3IMQrY.bin/get';
    final String docUrl = await apiClient.uploadFile(doc.value).then((value) {
      return value.imageUrls.first;
    });

    return apiClient.uploadDocs(
      user.uid,
      photoUrl: photoUrl,
      doc: doc.copyWith(url: docUrl),
    );
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
    var json = await SharedPref().read('USER');
    if (json != null) {
      return User.fromMap(json);
    }
    return Future<User>.delayed(const Duration(seconds: 2), () => null);
    // User user = await prefs.read('User');
  }

  /*Future<User> authenticate ({
    @required String username,
    @required String password,
  }) async {
    UserLogin userLogin = UserLogin(
        username: username,
        password: password
    );
    Token token = await getToken(userLogin);
    User user = User(
      id: 0,
      username: username,
      token: token.token,
    );
    return user;
  }
*/
  Future<void> persistToken({@required User user}) async {
    // write token with the user to the database
    //await userDao.createUser(user);
  }

  Future<void> deleteToken({@required int id}) async {
    //await userDao.deleteUser(id);
  }

  Future<bool> hasToken() async {
    //bool result = await userDao.checkUser(0);
    return true; //result;
  }

  ///Function to refresh the request
  Future<Tokens> refreshTokens(Tokens tokens) async {
    return apiClient.refreshTokens(tokens);
  }

  Future<void> logUserOut() async {
    await prefs.remove('USER');
  }
}
