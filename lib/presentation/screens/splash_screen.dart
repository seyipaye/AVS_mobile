import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthError) {
            Scaffold.of(context).showSnackBar(AppSnackBar.error(state.message));
          }
        },
        child: Center(
          child: Image.asset(
            'assets/images/nipost.png',
            width: 300,
            height: 100,
          ),
        ),
      ),
    );
  }
}
