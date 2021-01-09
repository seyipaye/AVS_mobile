import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage2 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final PageController controller;
  RegisterPage2(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthAppBar(
          title: 'Great!',
          subTitle: 'Kindly check your sms. We sent you an OTP',
        ),
        SizedBox(height: 20.0),
        // Body
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, AuthenticationState state) {
                  return AppTextFormField(
                    label:
                        'Please enter the OTP sent to ${(state as Unauthenticated).user.id}',
                    //obscureText: hidePassword,
                    //onSaved: (String val) => _newUser.password = val.trim(),
                    //validator: Validator.isPassword,
                    /*suffixIcon: IconButton(
                        icon: hidePassword
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() => hidePassword = !hidePassword);
                        },
                      ),*/
                  );
                }),
                authSpacer,
                AppRaisedButton(
                  text: 'Continue',
                  //isLoading: isLoading,
                  onPressed: (context) {
                    controller.nextPage(
                        duration: kAnimationDuration, curve: Curves.linear);
                  }, //nextPage,
                ),
                authSpacer,
              ],
            ),
          ),
        )
      ],
    );
  }
}
