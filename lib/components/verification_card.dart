import 'package:flutter/material.dart';
import 'package:avs/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerificationCard extends StatefulWidget {
  @override
  _VerificationCardState createState() => _VerificationCardState();
}

class _VerificationCardState extends State<VerificationCard> {
  var button;
  Widget declineButton = SizedBox();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 18,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        'Nov 24,202',
                        style: boldText,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.home,
                      size: 18,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        'Nov 24,202',
                        style: text,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.user,
                      size: 18,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        'Nov 24,202',
                        style: text,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.mapMarker,
                      size: 18,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        'Nov 24,202',
                        style: text,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          declineButton = RaisedButton(
                            onPressed: () {
                              setState(() {
                                declineButton = SizedBox();
                              });
                            },
                            child: Text(
                              "Approved",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            color: Colors.green,
                          );
                        });
                      },
                      child: Text(
                        "Active",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      color: activeCard,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    declineButton
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class PendingButton extends StatefulWidget {
//   @override
//   _PendingButtonState createState() => _PendingButtonState();
// }
//
// class _PendingButtonState extends State<PendingButton> {
//   Widget row;
//
//   @override
//   void initState() {
//     super.initState();
//     Widget rowButtons = Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         RaisedButton(
//           onPressed: () {},
//           child: Text(
//             "Accept",
//             style: TextStyle(fontSize: 20, color: Colors.white),
//           ),
//           color: activeCard,
//         ),
//         RaisedButton(
//           onPressed: () {
//             setState(() {});
//           },
//           child: Text(
//             "Decline",
//             style: TextStyle(fontSize: 20, color: Colors.white),
//           ),
//           color: activeCard,
//         )
//       ],
//     );
//     Widget pendingButton = RaisedButton(
//       onPressed: () {
//         setState(() {
//           row = rowButtons;
//         });
//       },
//       child: Text(
//         "Pending",
//         style: TextStyle(fontSize: 20, color: Colors.white),
//       ),
//       color: Colors.red,
//     );
//
//     row = pendingButton;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return row;
//   }
// }
