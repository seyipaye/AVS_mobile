import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(''),
                    radius: 75,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Abubakar Abdullahi',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  // width: MediaQuery.of(context).size.width/2,
                  child: Column(
                    children: [
                      _profileOption(
                          icon: Icons.edit,
                          text: 'Change Password',
                          onTap: () {}),
                      _profileOption(
                          icon: Icons.payment, text: 'Wallet', onTap: () {}),
                      _profileOption(
                          icon: Icons.power_settings_new_rounded,
                          color: Colors.red,
                          text: 'Log Out',
                          onTap: () {
                            // BlocProvider.of<AuthenticationCubit>(context)
                            //     .logUserOut();
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _profileOption(
          {@required IconData icon,
          @required String text,
          @required Function onTap,
          Color color}) =>
      Row(
        children: [
          Icon(
            icon,
            color: color ?? color,
          ),
          SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              text,
              style: TextStyle(
                color: color ?? color,
              ),
            ),
          ),
        ],
      );
}
