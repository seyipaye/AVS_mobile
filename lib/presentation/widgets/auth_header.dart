import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthAppBar extends StatelessWidget {
  final String title;
  final String subTitle;
  const AuthAppBar({
    Key key,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: kToolbarHeight, left: 20),
              margin: EdgeInsets.only(bottom: 40),
              color: AppColors.primaryColor[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          subTitle,
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/profile_img.png',
                      height: 100,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 0,
              child: Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.all(20),
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor[50],
                  shape: CircleBorder(),
                ),
                child: SvgPicture.asset(
                  'assets/logo.svg',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
