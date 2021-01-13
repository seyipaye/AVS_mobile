import 'dart:async';

import 'package:avs/data/api_responses/status_response.dart';
import 'package:avs/data/models/user.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  //final userDao = UserDao();
  final apiClient = AVSApiClient();

  Future<User> setUser({User user}) {
    return Future.delayed(Duration(seconds: 2)).then((value) => user);
    return apiClient.setUser(user: user);
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

  Future<User> getUser() {
    return Future<User>.delayed(const Duration(seconds: 2), () => null);
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
}
