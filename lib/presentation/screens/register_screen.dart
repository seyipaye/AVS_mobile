import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RegisterScreen());
  }

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(
            title: 'Register',
            subTitle: 'Get your free AVS account now',
          ),
          SizedBox(height: 20.0),
          // Body
          Expanded(child: _buildForm(context))
        ],
      ),
    );
  }

  final spacer = SizedBox(
    height: 30.0,
  );

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            AppTextFormField(
              label: 'First Name',
              //onSaved: (String val) => _newUser.fName = val,
              //validator: Validator.isName,
            ),
            spacer,
            AppTextFormField(
              label: 'Last Name',
              //onSaved: (String val) => _newUser.lName = val,
              //validator: Validator.isName,
            ),
            spacer,
            AppTextFormField(
              label: 'Email Address',
              hintText: 'example@mail.com',
              //onSaved: (String val) => _newUser.email = val.trim(),
              //validator: Validator.isEmail,
            ),
            spacer,
            AppTextFormField(
              label: 'Password',
              readOnly: false,
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
            spacer,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 13,
                    height: kLineHeight(fontSize: 13, height: 20)),
                text: 'By registering you agree to the AVS ',
                children: [
                  TextSpan(
                    text: 'Terms of Use',
                    style: TextStyle(color: AppColors.primaryColor),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        /*Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => WebViewScreen(
                          title: 'Terms of Service',
                          initialUrl: privacyUrl,
                        ),
                      ),
                    );*/
                      },
                  ),
                ],
              ),
            ),
            spacer,
            AppRaisedButton(
              text: 'Register',
              //isLoading: isLoading,
              onPressed: (context) {}, //nextPage,
            ),
            spacer,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 13,
                    height: kLineHeight(fontSize: 13, height: 20)),
                text: 'Already have an account ?',
                children: [
                  TextSpan(
                    text: ' Login',
                    style: TextStyle(color: AppColors.primaryColor),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        /*Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => WebViewScreen(
                          title: 'Terms of Service',
                          initialUrl: privacyUrl,
                        ),
                      ),
                    );*/
                      },
                  ),
                ],
              ),
            ),
            spacer,
          ],
        ),
      ),
    );
  }
}
