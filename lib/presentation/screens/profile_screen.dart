import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/widgets/app_card.dart';
import 'package:avs/presentation/widgets/avatar_image.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'full_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8.0),
            alignment: Alignment.center,
            child: FlatButton(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'View Details',
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: AppColors.primaryColor),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.topRight,
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 400),
                    child: FullProfileScreen(),
                  ),
                );
              },
            ),
          )
        ],
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff151522),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopSection(),
              SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'MORE',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: kLineHeight(fontSize: 12, height: 20),
                      color: AppColors.icons),
                ),
              ),
              SizedBox(height: 5),
              AppCard(
                radius: 16.0,
                blurRadius: 16.0,
                color: Colors.white,
                child: Material(
                  color: Colors.transparent,
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
                            BlocProvider.of<AuthenticationCubit>(context)
                                .logUserOut();
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTopSection() {
    return Container(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Container(
            height: 79,
            width: 79,
            child: AvatarImage('https://i.pravatar.cc/400'),
          ),
          SizedBox(height: 20),
          Text(
            'Abubakar Abdullahi',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 15,
                color: AppColors.icons,
              ),
              SizedBox(width: 5),
              Text(
                'Afijio Kwara',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff787676)),
              )
            ],
          )
        ],
      ),
    );
  }

  _profileOption(
      {@required IconData icon,
      @required String text,
      Color color,
      Widget trailing,
      VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 11),
        child: Row(
          children: [
            Icon(
              icon,
              color: color ?? color,
              size: 20,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: AppColors.text2, fontSize: 14),
                maxLines: 1,
              ),
            ),
            trailing ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
