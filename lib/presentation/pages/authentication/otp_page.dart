import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/logic/cubits/otp_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final PageController controller;
  final userRepository;
  final authenticationCubit;

  OtpPage(
    this.controller,
    this.authenticationCubit,
    this.userRepository,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpCubit(
        userRepository,
        authenticationCubit,
        formKey: formKey,
        controller: controller,
      ),
      child: Column(
        children: [
          AuthAppBar(
            title: 'Great!',
            subTitle: 'Kindly check your sms. We sent you an OTP',
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
      child: BlocConsumer<OtpCubit, OtpState>(
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
          print(state);
          return Form(
            key: formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              children: [
                AppTextFormField(
                  label:
                      'Please enter the OTP sent to ${context.watch<AuthenticationCubit>().user.mobile}',
                  maxLength: 4,
                  onSaved: (String val) =>
                      context.read<OtpCubit>().otpCode = val.trim(),
                  validator: Validator.isOtp,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                authSpacer,
                AppRaisedButton(
                  text: 'Continue',
                  isLoading: state.isLoading,
                  onPressed: (context) {
                    FocusScope.of(context).unfocus();
                    context.read<OtpCubit>().handleContinue();
                  }, //nextPage,
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
