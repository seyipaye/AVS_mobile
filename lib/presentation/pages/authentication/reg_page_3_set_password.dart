import 'package:avs/logic/cubits/set_password_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetPasswordPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final PageController controller;
  final userRepository;
  final authenticationCubit;

  SetPasswordPage(
    this.controller,
    this.authenticationCubit,
    this.userRepository,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SetPasswordCubit(
        userRepository,
        authenticationCubit,
        controller: controller,
      ),
      child: Column(
        children: [
          AuthAppBar(
            title: 'Almost there!',
            subTitle:
                'Choose a password you will remember, you will need this later',
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
      child: BlocConsumer<SetPasswordCubit, SetPasswordState>(
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
          return Form(
            key: formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              children: [
                AppTextFormField(
                  label: 'Set password',
                  helperText: 'Password needs to be at least 8 characters long',
                  obscureText: state.hidePassword,
                  onSaved: (String val) =>
                      context.read<SetPasswordCubit>().password = val.trim(),
                  validator: Validator.isPassword,
                  suffixIcon: IconButton(
                    icon: state.hidePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.remove_red_eye),
                    onPressed: () => context
                        .read<SetPasswordCubit>()
                        .togglePasswordVisibility(),
                  ),
                ),
                authSpacer,
                AppTextFormField(
                  label: 'Confirm password',
                  obscureText: state.hidePassword,
                  onSaved: (String val) => context
                      .read<SetPasswordCubit>()
                      .confirmPassword = val.trim(),
                  validator: Validator.isPassword,
                  suffixIcon: IconButton(
                    icon: state.hidePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.remove_red_eye),
                    onPressed: () => context
                        .read<SetPasswordCubit>()
                        .togglePasswordVisibility(),
                  ),
                ),
                authSpacer,
                AppRaisedButton(
                  text: 'Continue',
                  isLoading: state.isLoading,
                  onPressed: (context) {
                    context.read<SetPasswordCubit>().handleContinue(context);
                  },
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
