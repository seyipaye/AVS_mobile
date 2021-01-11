import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/screens/home_screen.dart';
import 'package:avs/presentation/screens/splash_screen.dart';
import 'package:avs/utils/styles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/authentication_repository.dart';
import 'logic/cubits/authentication_cubit.dart';
import 'presentation/widgets/loading_screen.dart';

void main() {
  final UserRepository userRepository = UserRepository();
  EquatableConfig.stringify = true;
  runApp(
    RepositoryProvider.value(
      value: userRepository,
      child: BlocProvider(
        create: (context) {
          return AuthenticationCubit(userRepository: userRepository);
        },
        child: AVSApp(),
      ),
    ),
  );
}

class AVSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().light,
      home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          print(state);
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Unauthenticated) {
            return AuthenticationScreen();
          }
          if (state is Authenticated) {
            return HomeScreen();
          }
          if (state is AuthError) {
            return SplashScreen();
          }
          return LoadingScreen();
        },
      ),
    );
  }
}
