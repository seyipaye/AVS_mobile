import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final AuthenticationCubit authCubit;
  final Dio dio = Dio();

  ApiInterceptor(this.authCubit);

  @override
  Future onResponse(Response response) async {
    if (response.statusCode == 401) {
      await authCubit.refreshTokens();
      return await dio.request(response.request.path,
          options: Options(
              headers: {'Authentication': authCubit.user.tokens.access.token}));
    }
    return response;
  }

  @override
  Future onError(DioError err) async {
    print('this was executed');
    if (err.response.statusCode == 401) {
      await authCubit.refreshTokens();
      RequestOptions options = err.response.request;
      options.headers["Authorization"] =
          "Bearer " + authCubit.user.tokens.access.token;
      return await dio.request(options.path, options: options);
    }
    return err;
  }
}
