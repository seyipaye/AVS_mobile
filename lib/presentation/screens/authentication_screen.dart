import 'package:avs/data/models/user.dart';
import 'package:avs/data/repositories/authentication_repository.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/pages/authentication/login_page.dart';
import 'package:avs/presentation/pages/authentication/reg_page_1_phone_number.dart';
import 'package:avs/presentation/pages/authentication/reg_page_2_otp.dart';
import 'package:avs/presentation/pages/authentication/reg_page_3_set_password.dart';
import 'package:avs/presentation/pages/authentication/reg_page_4_user_info.dart';
import 'package:avs/presentation/pages/authentication/reg_page_5_document_upload.dart';
import 'package:avs/presentation/pages/authentication/reg_page_6_address_info.dart';
import 'package:avs/presentation/pages/authentication/reg_page_7_address_confirm.dart';
import 'package:avs/utils/constants.dart';
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
    controller = PageController(initialPage: 1);
    final userRepository = context.read<UserRepository>();
    final authenticationCubit = context.read<AuthenticationCubit>();

    pages = [
      PhoneNumberPage(controller, authenticationCubit,
          userRepository), //This should be forgot password page
      LoginPage(controller, authenticationCubit, userRepository),
      PhoneNumberPage(controller, authenticationCubit, userRepository),
      OtpPage(controller, authenticationCubit, userRepository),
      SetPasswordPage(controller, authenticationCubit, userRepository),
      UserInfoPage(controller, authenticationCubit, userRepository),
      DocumentUploadPage(controller, authenticationCubit, userRepository),
      AddressInfoPage(controller, authenticationCubit, userRepository),
      AddressConfirmPage(controller, authenticationCubit, userRepository),
    ];
  }

  Future<bool> onWillPop() {
    bool result = true;
    if (controller.page != 1) {
      // controller.animateToPage(1,
      //     duration: kAnimationDuration, curve: Curves.linear);
      controller.previousPage(
          duration: kAnimationDuration, curve: Curves.linear);
      result = false;
    }
    return Future.value(result);
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
          return WillPopScope(
            onWillPop: onWillPop,
            child: PageView.builder(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              itemBuilder: (_, index) => pages[index],
            ),
          );
        },
      ),
    );
  }
}
