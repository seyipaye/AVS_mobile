import 'package:avs/pages/forgot_password_page.dart';
import 'package:avs/pages/home_page.dart';
import 'package:avs/pages/registration_page.dart';
import 'package:avs/screens/dashboard_screen.dart';
import 'package:avs/services/networking/log_in_network.dart';
import 'package:avs/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avs/utils/constants.dart';
import 'package:loading_overlay/loading_overlay.dart';

const Widget space = SizedBox(height: 20);
const TextStyle style = TextStyle(fontSize: 20);

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  LogInNetwork network = LogInNetwork();

  ///Variables to be assigned on click of the button
  String email;
  String password;
  bool progressBar = false;

  ///Text field controllers
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();

  Validator validator = Validator();

  /// Function to log user into the app*/
  Future<void> logUserIn() async {
    setState(() {
      progressBar = true;
    });
    var bool = await network.logUserIn(email, password);
    if (bool) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return HomePage(
            screen: DashboardScreen(),
          );
        }),
      );
    } else {
      print('wrong password');
      setState(() {
        progressBar = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).accentColor,
      body: LoadingOverlay(
        isLoading: progressBar,
        opacity: 1,
        color: Colors.white,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          backgroundColor: Colors.white,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.all(30),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Login", style: boldSubHeader),
                      space,
                      Text(
                        "Welcome back, please login to your account ",
                        style: text,
                      ),
                      space,

                      ///Email Text Field
                      TextField(
                        cursorColor: Color(0xFFFFC548),
                        controller: emailCon,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(
                            FontAwesomeIcons.user,
                          ),
                        ),
                      ),
                      space,

                      ///Password Text Field
                      TextField(
                        controller: passwordCon,
                        obscureText: true,
                        cursorColor: Color(0xFFFFC548),
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(FontAwesomeIcons.lock),
                        ),
                      ),
                      space,
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFFC548),
                          ),
                        ),
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ///Register button
                          OutlineButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegistrationPage();
                              }));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFFFC548),
                              ),
                            ),
                          ),

                          /// Log In Button
                          FlatButton(
                            color: Color(0xFFFFC548),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              email = emailCon.text;
                              password = passwordCon.text;
                              if (validator.validateEmail(email) &&
                                  validator.fieldNotEmpty(password)) {
                                logUserIn();
                              } else {
                                print('Invalid password or email');
                              }

                              // sharedPref();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "OR",
                            style: style,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFF1451B1),
                            ),
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFF4285F4),
                            ),
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      space,
                    ],
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
