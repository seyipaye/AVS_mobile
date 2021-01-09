import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage3 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final PageController controller;
  RegisterPage3(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthAppBar(
          title: 'Almost there!',
          subTitle:
              'Choose a password you will remember, you will need this later',
        ),
        SizedBox(height: 20.0),
        // Body
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                AppTextFormField(
                  label: 'Set password',
                  helperText: 'Password needs to be at least 8 characters long',
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
                ),
                authSpacer,
                AppTextFormField(
                  label: 'Confirm password',
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
                ),
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
