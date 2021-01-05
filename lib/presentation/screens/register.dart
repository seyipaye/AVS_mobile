import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 27),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
              ),
              /*Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  height: 54,

                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ),*/
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hi Seyi!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
