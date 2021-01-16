import 'package:avs/presentation/widgets/agent_rating.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/bar_chart.dart';
import 'package:avs/presentation/widgets/bar_chart_group_data.dart';
import 'package:avs/presentation/widgets/completion_chart.dart';
import 'package:avs/presentation/widgets/page_title.dart';
import 'package:avs/presentation/widgets/profile_image.dart';
import 'package:avs/presentation/widgets/request_count_card.dart';
import 'package:avs/presentation/widgets/request_item_card.dart';
import 'package:avs/presentation/widgets/wallet_data.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen();
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageHeader(title: "DASHBOARD"),
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
                              'Welcome Back !',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            space,
                            Text(
                              'Username',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor),
                            ),
                            space,
                            ProfileImage(
                              radius: 45,
                            ),
                            space,
                            Text(
                              'Username',
                              style: kBoldTextStyle(context),
                            ),
                            Text('Usertype'),
                            space,
                            Row(
                              children: <Widget>[
                                AgentRating(
                                  rating: '5.0',
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
                            AppRaisedButton(
                              onPressed: (context) {},
                              text: 'View Profile',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                cardSpace,
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Earning',
                              style: kBoldTextStyle(context),
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
                        CompletionChart(
                          size: 100,
                          percentage: 36,
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        padding: const EdgeInsets.only(
                            right: 20, top: 20, bottom: 20),
                        child: MyBarChart(
                          list: [
                            groupData(
                                position: 0,
                                width: 4,
                                approved: 30,
                                pending: 40,
                                rejected: 20),
                            groupData(
                                position: 1,
                                width: 4,
                                approved: 10,
                                pending: 40,
                                rejected: 20),
                            groupData(
                                position: 2,
                                width: 4,
                                approved: 30,
                                pending: 10,
                                rejected: 20),
                            groupData(
                                position: 3,
                                width: 4,
                                approved: 40,
                                pending: 40,
                                rejected: 10),
                            groupData(
                                position: 4,
                                width: 4,
                                approved: 20,
                                pending: 20,
                                rejected: 40),
                            groupData(
                                position: 5,
                                width: 4,
                                approved: 30,
                                pending: 10,
                                rejected: 10),
                            groupData(
                                position: 6,
                                width: 4,
                                approved: 30,
                                pending: 50,
                                rejected: 5),
                            groupData(
                                position: 7,
                                width: 4,
                                approved: 20,
                                pending: 40,
                                rejected: 30),
                            groupData(
                                position: 8,
                                width: 4,
                                approved: 10,
                                pending: 10,
                                rejected: 20),
                            groupData(
                                position: 9,
                                width: 4,
                                approved: 30,
                                pending: 30,
                                rejected: 20),
                            groupData(
                                position: 10,
                                width: 4,
                                approved: 30,
                                pending: 30,
                                rejected: 30),
                            groupData(
                                position: 11,
                                width: 4,
                                approved: 10,
                                pending: 40,
                                rejected: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                space,
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
