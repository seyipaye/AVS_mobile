import 'package:avs/services/networking/forgot_password_network.dart';
import 'package:avs/utils/validator.dart';
import 'package:flutter/material.dart';

const Widget space = SizedBox(height: 20);
const TextStyle style = TextStyle(fontSize: 20);

// ignore: must_be_immutable
class ForgotPasswordPage extends StatelessWidget {
  String email;

  final ForgotPasswordNetwork network = ForgotPasswordNetwork();
  final Validator validator = Validator();
  final emailCon = TextEditingController();

  void resetPassword(context) async {
    bool status = await network.resetPassword(email);
    if (status) {
      Navigator.pop(context);
    } else {
      print('fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Theme.of(context).accentColor,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recover your password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        space,
                        Text(
                          "Please enter your email address and"
                          " we'll send you instructions on "
                          "how to reset your password.",
                          style: style,
                        ),
                        space,

                        ///Email Text Field
                        TextField(
                          cursorColor: Theme.of(context).accentColor,
                          controller: emailCon,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        space,
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: OutlineButton(
                            borderSide: BorderSide(
                              color: Color(0xFFFFC548),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Back to login",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFFFC548),
                              ),
                            ),
                          ),
                        ),
                        space,
                        Container(
                          width: double.infinity,
                          height: 60,
                          child:

                              ///Recover Password Button
                              FlatButton(
                            color: Color(0xFFFFC548),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              email = emailCon.text;
                              if (validator.validateEmail(email)) {
                                resetPassword(context);
                              }
                            },
                            child: Text(
                              "Recover password",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
