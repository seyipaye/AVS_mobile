import 'package:avs/data/providers/dashboard_provider.dart';
import 'package:avs/data/repositories/dashboard_repository.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/logic/cubits/dashboard_cubit.dart';
import 'package:avs/presentation/screens/reqests_screen.dart';
import 'package:avs/presentation/widgets/end_drawer.dart';
import 'package:avs/utils/styles.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'dash_board_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    BlocProvider(
      create: (context) => DashboardCubit(
        repository: DashboardRepository(
          DashboardProvider(
            BlocProvider.of<AuthenticationCubit>(context),
          ),
        ),
      ),
      child: DashBoardScreen(),
    ),
    RequestsScreen(),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
    Text(
      'Index 3: More',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: AppDrawer(),
      // endDrawer: EndDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Container buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 6,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: AppColors.primaryColor,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Dashboard',
                ),
                GButton(
                  icon: LineIcons.list_alt,
                  text: 'Requests',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
                GButton(
                  icon: LineIcons.ellipsis_v,
                  text: 'More',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                // index == 3
                //     ? _drawerKey.currentState.openEndDrawer()
                //  :
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
