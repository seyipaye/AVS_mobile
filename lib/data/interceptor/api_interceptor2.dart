import 'dart:io';

import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/utils/constant_strings.dart';
import 'package:dio/dio.dart';

class ApiInterceptor2 extends Interceptor {
  final AuthenticationCubit authCubit;
  final Dio dio = Dio();

  ApiInterceptor2(this.authCubit);

  // @override
  // Future onResponse(Response response) async {
  //   if (response.statusCode == 401) {
  //     await authCubit.refreshTokens();
  //     return await dio.request(response.request.path,
  //         options: Options(
  //             headers: {'Authentication': authCubit.user.tokens.access.token}));
  //   }
  //   return response;
  // }

  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey(requiresToken)) {
      // Remove the auxiliary header
      options.headers.remove(requiresToken);

      // Add token
      String token = authCubit.user.tokens.access.token;

      options.headers.addAll({
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDEyYWVkMzQ3MjY2ZDAwMWQ0NTc3ZGMiLCJ1c2VyIjp7ImF1dGhNZXRob2RzIjpbIkxPQ0FMIl0sIm1vYmlsZSI6IjA4MTUyNjQyNTMzMyIsInR5cGUiOiJBR0VOVCIsImNyZWF0ZWRBdCI6IjIwMjEtMDEtMjhUMTI6MzI6MTkuODMyWiIsInVwZGF0ZWRBdCI6IjIwMjEtMDEtMjhUMTI6MzI6MjcuODYzWiIsImVtYWlsIjoib21vdG9sZ3NkdWVqakBnbWFpbC5jb20iLCJpZCI6IjYwMTJhZWQzNDcyNjZkMDAxZDQ1NzdkYyIsImV4dHJhIjp7InByb2ZpbGUiOnsiZW1haWwiOnsiaXNWZXJpZmllZCI6ZmFsc2UsImFkZHJlc3MiOiJvbW90b2xnc2R1ZWpqQGdtYWlsLmNvbSJ9LCJtb2JpbGUiOnsiaXNWZXJpZmllZCI6dHJ1ZSwibnVtYmVyIjoiMDgxNTI2NDI1MzMzIiwidmVyaWZpZWRPbiI6IjIwMjEtMDEtMjhUMTI6MzI6MjcuODcxWiJ9LCJmaXJzdE5hbWUiOiJUb2xhbmkiLCJsYXN0TmFtZSI6Ill1bnVzIiwib3RoZXJOYW1lIjoiRHVwc3kiLCJnZW5kZXIiOiJmZW1hbGUifSwiYWRkcmVzcyI6eyJpc1ZlcmlmaWVkIjp0cnVlLCJzdGF0ZSI6IkxhZ29zIiwibGdhIjoiRXRpLW9zYSIsInBvc3RhbENvZGUiOiIxMDEyMjIiLCJzdHJlZXRBZGRyZXNzIjoiMjYxIEV0aW0gSW55YW5nIENyZXNjZW50LCBWaWN0b3JpYSBJc2xhbmQiLCJnZW8iOnsiY29vcmRpbmF0ZXMiOlszLjQzNjA4MjIsNi40MzMyNTUzXSwidHlwZSI6IlBvaW50In0sInZlcmlmaWVkT24iOiIyMDIxLTAxLTI4VDEzOjAyOjI2Ljk4N1oifSwic3RhdHVzIjoiUEVORElORyIsInR5cGUiOiJJTkRfQUdFTlQiLCJ3YWxsZXRCYWxhbmNlIjowLCJyYXRpbmciOjAsInRvdGFsQXNzaWduZWRSZXF1ZXN0cyI6MCwidXNlciI6IjYwMTJhZWQzNDcyNjZkMDAxZDQ1NzdkYyIsImNyZWF0ZWRCeSI6IjYwMTJhZWQzNDcyNjZkMDAxZDQ1NzdkYyIsImhpc3RvcnkiOltdLCJJRCI6W10sInJlcXVlc3RzUmVqZWN0ZWQiOltdLCJjcmVhdGVkQXQiOiIyMDIxLTAxLTI4VDEyOjMyOjI3Ljg3NloiLCJ1cGRhdGVkQXQiOiIyMDIxLTAxLTI4VDEzOjAyOjI2Ljk4OVoiLCJhZ2VudElkIjoyMSwiaWQiOiI2MDEyYWVkYjQ3MjY2ZDAwMWQ0NTc3ZGQifX0sImlhdCI6MTYxMTgzOTM2OSwiZXhwIjoxNjExODQxMTY5fQ.IgZXZS9cIljWpXqQEpKk75wSoJta9r8IlTFG31m75vA'
      });

      print('used ${options.headers}');
      return options;
    }
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) async {
    print('xsm  ${err.response.data}');
    // if (err.response.statusCode == 401) {
    //   if (await authCubit.refreshTokens()) {
    //     RequestOptions options = err.response.request;
    //     options.headers["Authorization"] =
    //         "Bearer " + authCubit.user.tokens.access.token;
    //     return await dio.request(options.path, options: options);
    //   }
    // }
    return err;
  }
}
