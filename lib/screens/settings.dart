import 'package:avs/components/reusable_card.dart';
import 'package:avs/screens/setting_screens/change_password_screen.dart';
import 'package:avs/screens/setting_screens/company_info_screen.dart';
import 'package:avs/screens/setting_screens/general_screen.dart';
import 'package:avs/screens/setting_screens/info_screen.dart';
import 'package:avs/screens/setting_screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:avs/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var general = [activeCard, activeCard];
  var changePassword = [Colors.black, Colors.transparent];
  var info = [Colors.black, Colors.transparent];
  var companyInfo = [Colors.black, Colors.transparent];
  var notifications = [Colors.black, Colors.transparent];
  dynamic currentFragment = GeneralScreen();

  void makeInactive() {
    setState(() {
      general = [Colors.white, Colors.transparent];
      changePassword = [Colors.white, Colors.transparent];
      info = [Colors.white, Colors.transparent];
      companyInfo = [Colors.white, Colors.transparent];
      notifications = [Colors.white, Colors.transparent];
    });
  }

  void makeActive(item) {
    setState(() {
      item = [activeCard, activeCard];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      makeActive(general);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SettingsMenuItem(
                                icon: FontAwesomeIcons.user,
                                colour: general[0],
                                indicator: general[1],
                                onClick: () {
                                  setState(() {
                                    makeInactive();
                                    general = [activeCard, activeCard];
                                    currentFragment = GeneralScreen();
                                  });
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SettingsMenuItem(
                                icon: FontAwesomeIcons.lock,
                                colour: changePassword[0],
                                indicator: changePassword[1],
                                onClick: () {
                                  setState(() {
                                    makeInactive();
                                    changePassword = [activeCard, activeCard];
                                    currentFragment = ChangePasswordScreen();
                                  });
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SettingsMenuItem(
                                icon: FontAwesomeIcons.infoCircle,
                                colour: info[0],
                                indicator: info[1],
                                onClick: () {
                                  setState(() {
                                    makeInactive();
                                    info = [activeCard, activeCard];
                                    currentFragment = InfoScreen();
                                  });
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SettingsMenuItem(
                                icon: FontAwesomeIcons.briefcase,
                                colour: companyInfo[0],
                                indicator: companyInfo[1],
                                onClick: () {
                                  setState(() {
                                    makeInactive();
                                    companyInfo = [activeCard, activeCard];
                                    currentFragment = CompanyInfoScreen();
                                  });
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SettingsMenuItem(
                                icon: FontAwesomeIcons.bell,
                                colour: notifications[0],
                                indicator: notifications[1],
                                onClick: () {
                                  setState(() {
                                    makeInactive();
                                    notifications = [activeCard, activeCard];
                                    currentFragment = NotificationScreen();
                                  });
                                },
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            child: currentFragment,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsMenuItem extends StatelessWidget {
  final IconData icon;
  final Color colour;
  final Color indicator;
  final Function onClick;

  SettingsMenuItem(
      {@required this.icon,
      @required this.colour,
      @required this.indicator,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                icon,
                color: colour,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 5,
            color: indicator,
          )
        ],
      ),
    );
  }
}
