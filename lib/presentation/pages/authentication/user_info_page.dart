import 'package:avs/data/models/user.dart';
import 'package:avs/logic/cubits/user_info_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_dropdown_button.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final PageController controller;
  final userRepository;
  final authenticationCubit;

  UserInfoPage(
    this.controller,
    this.authenticationCubit,
    this.userRepository,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserInfoCubit(
        userRepository,
        authenticationCubit,
        controller: controller,
      ),
      child: Column(
        children: [
          AuthAppBar(
            title: 'Awesome!',
            subTitle: 'Now, carefully fill in your details and proceed to pay',
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
      child: BlocConsumer<UserInfoCubit, UserInfoState>(
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
          final userInfoCubit = context.watch<UserInfoCubit>();
          return Form(
            key: formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fields marked with asteriks (*) are compulsory',
                ),
                SizedBox(height: 20),
                AppTextFormField(
                  label: '*First Name',
                  onSaved: (String val) => userInfoCubit.firstName = val,
                  validator: Validator.isName,
                ),
                authSpacer,
                AppTextFormField(
                  label: '*Last Name',
                  onSaved: (String val) => userInfoCubit.lastName = val,
                  validator: Validator.isName,
                ),
                authSpacer,
                AppTextFormField(
                  label: 'Other Names',
                  onSaved: (String val) => userInfoCubit.otherNames = val,
                  validator: Validator.isOtherName,
                ),
                authSpacer,
                AppDropDownButton(
                  label: '*Gender',
                  hint: "Select Gender",
                  value: userInfoCubit.gender,
                  validator: Validator.isGender,
                  onSaved: (gender) => userInfoCubit.gender = gender,
                  items: [
                    DropdownMenuItem(
                      value: 'female',
                      child: Text(
                        'Female',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'male',
                      child: Text(
                        'Male',
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    userInfoCubit.gender = value;
                  },
                ),
                authSpacer,
                AppTextFormField(
                  label: 'Email Address',
                  hintText: 'mail@quickavs.ng',
                  onSaved: (String val) => userInfoCubit.email = val.trim(),
                  validator: Validator.isOptionalEmail,
                ),
                authSpacer,
                AppRaisedButton(
                  text: 'Continue',
                  isLoading: state.isLoading,
                  onPressed: userInfoCubit.handleContinue, //nextPage,
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
