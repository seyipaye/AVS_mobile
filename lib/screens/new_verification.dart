import 'package:avs/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewVerificationScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<NewVerificationScreen> {
  List<String> _sexes = [
    'Male',
    'Female',
    'Other',
  ]; // Option 2
  String _selectedSex; // Option 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'New Verification',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Create a Verification Request',
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Address',
                              prefixIcon: Icon(
                                FontAwesomeIcons.mapMarker,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name',
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              prefixIcon: Icon(
                                FontAwesomeIcons.envelope,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('Gender'),
                              value: _selectedSex,
                              items: <String>[
                                'Male',
                                'Female',
                                'Other',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedSex = newValue;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                OutlineButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  onPressed: () {},
                                  child: Text(
                                    "Reset",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFFFC548),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                FlatButton(
                                  color: Color(0xFFFFC548),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

// class NewVerificationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF2F2F2),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text('New Verification'),
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text('Create a Verification Request'),
//                         TextField(
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Address',
//                             prefixIcon: Icon(
//                               FontAwesomeIcons.mapMarker,
//                             ),
//                           ),
//                         ),
//                         TextField(
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'First Name',
//                             prefixIcon: Icon(
//                               FontAwesomeIcons.user,
//                             ),
//                           ),
//                         ),
//                         TextField(
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Last Name',
//                             prefixIcon: Icon(
//                               FontAwesomeIcons.user,
//                             ),
//                           ),
//                         ),
//                         TextField(
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Email',
//                             prefixIcon: Icon(
//                               FontAwesomeIcons.envelope,
//                             ),
//                           ),
//                         ),
//                         DropdownButton<String>(
//                           hint: Text('Gender'),
//                           items: <String>[
//                             'Male',
//                             'Female',
//                             'Other',
//                           ].map((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                           onChanged: (_) {},
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ]),
//         ),
//       ),
//     );
//   }
// }
