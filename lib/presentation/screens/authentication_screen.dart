import 'package:avs/data/models/user.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/pages/authentication/register_page1.dart';
import 'package:avs/presentation/pages/authentication/register_page2.dart';
import 'package:avs/presentation/pages/authentication/register_page3.dart';
import 'package:avs/presentation/pages/authentication/register_page4.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
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
    pages = [
      RegisterPage1(controller),
      RegisterPage2(controller),
      RegisterPage3(controller),
      RegisterPage4(controller),
      // RegisterPage2(
      //   carouselController: _carouselController,
      // ),
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
