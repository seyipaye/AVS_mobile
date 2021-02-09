import 'package:avs/logic/cubits/forgot_password_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
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
      create: (_) => ForgotPasswordCubit(
        userRepository,
        authenticationCubit,
        controller: controller,
      ),
      child: Column(
        children: [
          AuthAppBar(
            title: "We'll send a mail to you",
            subTitle: 'Enter your email',
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
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state.snackBar != null) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(state.snackBar)
                  .closed
                  .then(context.read<ForgotPasswordCubit>().clearOverlays);
          }
        },
        builder: (context, state) {
          //print(state);
          final cubit = context.watch<ForgotPasswordCubit>();
          return Form(
            key: formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextFormField(
                  label: 'Email Address',
                  hintText: 'mail@quickavs.ng',
                  onSaved: (String val) => cubit.email = val.trim(),
                  validator: Validator.isEmail,
                ),
                authSpacer,
                AppRaisedButton(
                  text: 'Log in',
                  isLoading: state.isLoading,
                  onPressed: cubit.handleContinue, //nextPage,
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
