import 'package:avs/presentation/widgets/agent_rating.dart';
import 'package:avs/presentation/widgets/bar_chart.dart';
import 'package:avs/presentation/widgets/request_count_card.dart';
import 'package:avs/presentation/widgets/request_item_card.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final cardSpace = SizedBox(
    height: 15,
  );

  final space = SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Image(),
                    Text(
                      'AVS',
                      style: kHeaderTextStyle(context),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'DASHBOARD',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Card(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 130,
                            color: AppColors.primaryColor[100],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset("assets/profile_img.png"),
                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome back!',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            space,
                            Text('Username'),
                            space,
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.primaryColor[50],
                              backgroundImage: AssetImage('assets/avatar.png'),
                            ),
                            space,
                            Text(
                              'Username',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            space,
                            Text('Usertype'),
                            space,
                            Row(
                              children: <Widget>[
                                AgentRating(
                                  rating: '3.2',
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                WalletInfo(
                                  walletBalance: '500.0',
                                ),
                              ],
                            ),
                            space,
                            RaisedButton(
                              onPressed: () {},
                              color: AppColors.primaryColor[300],
                              child: Text(
                                'ViewProfile',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                cardSpace,
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Earning',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'This month ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'NGN 0.00',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.arrow_down,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                Text(
                                  ' From previous period',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            height: 100,
                            child: PieChart(
                              PieChartData(
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 30,
                                sections: [
                                  PieChartSectionData(
                                      color: AppColors.primaryColor[300],
                                      value: 80,
                                      title: '80%',
                                      radius: 20,
                                      titleStyle: TextStyle(fontSize: 8)),
                                  PieChartSectionData(
                                      color: Colors.white,
                                      value: 20,
                                      title: '',
                                      radius: 20)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                cardSpace,
                RequestCountCard(
                  title: 'Total Request',
                  count: '0',
                  icon: CupertinoIcons.line_horizontal_3,
                ),
                RequestCountCard(
                  title: 'Total Completed',
                  count: '0',
                  icon: CupertinoIcons.person_crop_circle_fill_badge_checkmark,
                ),
                RequestCountCard(
                  title: 'Total Assigned',
                  count: '0',
                  icon: CupertinoIcons.waveform,
                ),
                cardSpace,
                Card(
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, top: 20),
                        child: MyBarChart(),
                      ),
                    ),
                  ),
                ),
                RequestItem(
                  verificationNumber: '0000000123',
                  status: 'COMPLETED',
                  streetAddress: 'No 13 Adeola Adekunmi Street',
                  lga: "Ibeji-Lekki",
                  state: 'Lagos State',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WalletInfo extends StatelessWidget {
  final String walletBalance;

  const WalletInfo({@required this.walletBalance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          walletBalance,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text('Wallet')
      ],
    );
  }
}
