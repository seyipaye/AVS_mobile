import 'package:avs/data/models/user.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/pages/authentication/phone_number_page.dart';
import 'package:avs/presentation/pages/authentication/otp_page.dart';
import 'package:avs/presentation/pages/authentication/password_page.dart';
import 'package:avs/presentation/pages/authentication/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final authSpacer = SizedBox(
  height: 30.0,
);

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen();

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  PageController controller;
  List<Widget> pages;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    final userRepository = context.read<UserRepository>();
    final authenticationCubit = context.read<AuthenticationCubit>();

    pages = [
      PhoneNumberPage(controller, authenticationCubit, userRepository),
      OtpPage(controller, authenticationCubit, userRepository),
      PasswordPage(controller),
      UserInfoPage(controller),
      // LogInPage(
      //   controller: _carouselController,
      // ),
      // ForgotPasswordPage(
      //   controller: _carouselController,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            if (state.user != null && state.user != User.empty) {
              // Check where user stopped registration
              // move to the page for user to continue
            }
          }
        },
        builder: (context, state) {
          return PageView.builder(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            itemCount: pages.length,
            itemBuilder: (_, index) => pages[index],
          );
        },
      ),
    );
  }
}
