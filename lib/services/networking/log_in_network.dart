import 'package:http/http.dart' as Http;

class LogInNetwork {
  Future<bool> logUserIn(String email, String password) async {
    Http.Response logInResponse = await Http.post(
        'https://avs-staging-api.herokuapp.com/v1/auth/local/login',
        body: {"email": email, "password": password});
    print(logInResponse.statusCode);
    return logInResponse.statusCode == 200;
  }
}
