import 'package:avs/components/reusable_card.dart';
import 'package:avs/screens/dashboard_screen.dart';
import 'package:avs/screens/new_verification.dart';
import 'package:avs/screens/profile_screen.dart';
import 'package:avs/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avs/constants.dart';

const black = Colors.black;
const white = Colors.white;

class HomePage extends StatefulWidget {
  final Widget screen;

  HomePage({this.screen});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dashboard = [activeCard, white];
  var addNew = [inactiveCard, black];
  var all = [inactiveCard, black];
  var active = [inactiveCard, black];
  var approved = [inactiveCard, black];
  var rejected = [inactiveCard, black];
  var profile = [inactiveCard, black];
  var settings = [inactiveCard, black];
  Widget presentScreen;

  void makeInactive() {
    dashboard = [inactiveCard, black];
    addNew = [inactiveCard, black];
    all = [inactiveCard, black];
    active = [inactiveCard, black];
    approved = [inactiveCard, black];
    rejected = [inactiveCard, black];
    profile = [inactiveCard, black];
    settings = [inactiveCard, black];
  }

  @override
  void initState() {
    super.initState();
    presentScreen = widget.screen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AVS'),
        backgroundColor: activeCard,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        './images/logo.jpg',
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "AVS",
                        style: TextStyle(fontSize: 20, color: activeCard),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        FontAwesomeIcons.times,
                        color: Color(0xFF938BF4),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: dashboard[0],
                  onPress: () {
                    setState(() {
                      makeInactive();
                      dashboard = [activeCard, white];
                      Navigator.pop(context);
                      presentScreen = DashboardScreen();
                    });
                  },
                  cardChild: Container(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.home,
                          color: dashboard[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(color: dashboard[1], fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Verifications'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: addNew[0],
                  onPress: () {
                    setState(() {
                      makeInactive();
                      addNew = [activeCard, white];
                      Navigator.pop(context);
                      presentScreen = NewVerificationScreen();
                    });
                  },
                  cardChild: Container(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.plus,
                          color: addNew[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add New',
                          style: TextStyle(color: addNew[1], fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: all[0],
                  onPress: () {
                    setState(() {
                      makeInactive();
                      all = [activeCard, white];
                    });
                  },
                  cardChild: Container(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.caretRight,
                          color: all[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'All',
                          style: TextStyle(color: all[1], fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: active[0],
                  onPress: () {
                    setState(() {
                      makeInactive();
                      active = [activeCard, white];
                    });
                  },
                  cardChild: Container(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.caretRight,
                          color: active[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Active',
                          style: TextStyle(color: active[1], fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: approved[0],
                  onPress: () {
                    setState(() {
                      makeInactive();
                      approved = [activeCard, white];
                    });
                  },
                  cardChild: Container(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.caretRight,
                          color: approved[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Approved',
                          style: TextStyle(color: approved[1], fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: rejected[0],
                  onPress: () {
                    setState(() {
                      makeInactive();
                      rejected = [activeCard, white];
                    });
                  },
                  cardChild: Container(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.caretRight,
                          color: rejected[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Rejected',
                          style: TextStyle(color: rejected[1], fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('ACCOUNT'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: profile[0],
                  onPress: () {
                    setState(() {
                      makeInactive();
                      profile = [activeCard, white];
                      Navigator.pop(context);
                      presentScreen = ProfileScreen();
                    });
                  },
                  cardChild: Container(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.user,
                          color: profile[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(color: profile[1], fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableCard(
                  colour: settings[0],
                  onPress: () {
                    setState(() {
                      makeInactive();
                      settings = [activeCard, white];
                      Navigator.pop(context);
                      presentScreen = SettingsScreen();
                    });
                  },
                  cardChild: Container(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.cog,
                          color: settings[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(color: settings[1], fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: presentScreen,
    );
  }
}
