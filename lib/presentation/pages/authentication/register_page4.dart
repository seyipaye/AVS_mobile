import 'package:avs/data/models/user.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_dropdown_button.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage4 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final PageController controller;
  RegisterPage4(this.controller);
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthAppBar(
          title: 'Awesome!',
          subTitle: 'Now, carefully fill in your details and proceed to pay',
        ),
        SizedBox(height: 20.0),
        // Body
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fields marked with asteriks (*) are compulsory',
                ),
                SizedBox(height: 20),
                AppTextFormField(
                  label: '*First Name',
                  //onSaved: (String val) => _newUser.fName = val,
                  //validator: Validator.isName,
                ),
                authSpacer,
                AppTextFormField(
                  label: '*Last Name',
                  //onSaved: (String val) => _newUser.lName = val,
                  //validator: Validator.isName,
                ),
                authSpacer,
                AppTextFormField(
                  label: 'Other Names',
                  //onSaved: (String val) => _newUser.lName = val,
                  //validator: Validator.isName,
                ),
                authSpacer,
                AppDropDownButton(
                  label: '*Gender',
                  hint: "Select Gender",
                  value: selectedGender,
                  // validator: Validator.isGender,
                  // onSaved: (gender) => _completeUser.gender = gender,
                  items: [
                    DropdownMenuItem(
                      value: Gender.Female,
                      child: Text(
                        'Female',
                      ),
                    ),
                    DropdownMenuItem(
                      value: Gender.Male,
                      child: Text(
                        'Male',
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    selectedGender = value;
                  },
                ),
                authSpacer,
                AppTextFormField(
                  label: 'Email Address',
                  hintText: 'mail@quickavs.ng',
                  //onSaved: (String val) => _newUser.email = val.trim(),
                  //validator: Validator.isEmail,
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
