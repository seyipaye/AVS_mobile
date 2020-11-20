import 'package:flutter/material.dart';

const Widget space = SizedBox(height: 20);
const TextStyle style = TextStyle(fontSize: 20);

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xFFCDD3E1),
        child: SafeArea(
          child: Center(
            child: Container(
              height: 500,
              color: Colors.white,
              margin: EdgeInsets.all(30),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
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
                      "Please enter your email address and we'll send you instructions on how to reset your password.",
                      style: style,
                    ),
                    space,
                    TextField(
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
                      child: FlatButton(
                        color: Color(0xFFFFC548),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () {},
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
    );
  }
}
