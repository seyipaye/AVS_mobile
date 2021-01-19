import 'package:avs/data/models/user.dart';
import 'package:avs/logic/cubits/login_cubit.dart';
import 'package:avs/logic/cubits/user_info_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_dropdown_button.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:avs/utils/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final PageController controller;
  final userRepository;
  final authenticationCubit;

  LoginPage(
    this.controller,
    this.authenticationCubit,
    this.userRepository,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        userRepository,
        authenticationCubit,
        controller: controller,
      ),
      child: Column(
        children: [
          AuthAppBar(
            title: 'Welcome!',
            subTitle: 'Sign in to continue to AVS',
          ),
          SizedBox(height: 20.0),
          // Body
          Expanded(
            child: _buildForm(),
          )
        ],
      ),
    );
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.hasError) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                AppSnackBar.error(state.errorMessage),
              );
          }
        },
        builder: (context, state) {
          //print(state);
          final loginCubit = context.watch<LoginCubit>();
          return Form(
            key: formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextFormField(
                  label: 'Email Address',
                  hintText: 'mail@quickavs.ng',
                  onSaved: (String val) => loginCubit.email = val.trim(),
                  validator: Validator.isEmail,
                ),
                authSpacer,
                AppTextFormField(
                  label: 'Password',
                  obscureText: state.hidePassword,
                  onSaved: (String val) => loginCubit.password = val.trim(),
                  validator: Validator.isPassword,
                  suffixIcon: IconButton(
                    icon: state.hidePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.remove_red_eye),
                    onPressed: () => loginCubit.togglePasswordVisibility(),
                  ),
                ),
                authSpacer,
                AppRaisedButton(
                  text: 'Log in',
                  isLoading: state.isLoading,
                  onPressed: loginCubit.handleContinue, //nextPage,
                ),
                authSpacer,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 16,
                        height: kLineHeight(fontSize: 16, height: 20)),
                    text: "Don't have an account? ",
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(color: AppColors.primaryColor),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = loginCubit.moveToSignUp,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                FlatButton.icon(
                  textColor: AppColors.forgotPassword,
                  label: Text('Forgot your password'),
                  onPressed: loginCubit.moveToForgotPassword,
                  icon: Icon(
                    Icons.lock,
                    size: 20,
                  ),
                ),
                authSpacer,
              ],
            ),
          );
        },
      ),
    );
  }
}
