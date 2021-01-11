import 'dart:async';

import 'package:avs/data/models/status_response.dart';
import 'package:avs/data/models/user.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  //final userDao = UserDao();
  final apiClient = AVSApiClient();

  Future<StatusResponse> sendOtp(String mobile) {
    return apiClient.sendOtp(mobile);
  }

  Future<StatusResponse> verifyOtp({String mobile, String code}) {
    return apiClient.verifyOtp(mobile: mobile, code: code);
  }

  Future<User> getUser() {
    return Future<User>.delayed(const Duration(seconds: 2), () => User.empty);
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
