import 'package:http/http.dart' as Http;

class ForgotPasswordNetwork {
  Future<bool> resetPassword(String email) async {
    Http.Response logInResponse = await Http.post(
        'https://avs-staging-api.herokuapp.com/v1/auth/forgot-password',
        body: {"email": email});
    print(logInResponse.statusCode);
    return logInResponse.statusCode == 204;
  }
}
