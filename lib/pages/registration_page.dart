import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:avs/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  dynamic image = Image(
    image: AssetImage(
      'images/profile_placeholder.png',
    ),
    fit: BoxFit.fill,
  );
  final picker = ImagePicker();
  List<String> _sexes = [
    'Male',
    'Female',
    'Other',
  ]; // Option 2
  String _selectedSex;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        var file = File(pickedFile.path);
        print('executed');
        var newImage = Image.file(
          file,
          fit: BoxFit.fill,
        );
        image = newImage;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: boldHeader,
                      ),
                      spaceHeight,

                      ///First name text field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'First Name*',
                        ),
                      ),
                      spaceHeight,

                      ///Last name text field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Last Name*',
                        ),
                      ),
                      spaceHeight,

                      ///Drop down
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text('Gender*'),
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
                      spaceHeight,

                      ///Phone Number text field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number*',
                        ),
                      ),
                      spaceHeight,

                      ///Email text field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Email*',
                        ),
                      ),
                      spaceHeight,

                      ///Street Number text field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Street Number',
                        ),
                      ),
                      spaceHeight,

                      ///Street Name text field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ''
                              'Street Name*',
                        ),
                      ),
                      spaceHeight,

                      ///Close Landmark text field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Close Landmark/Bus Stop*',
                        ),
                      ),
                      spaceHeight,

                      ///LGA text field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Local Government Area*',
                        ),
                      ),
                      spaceHeight,

                      ///State Text Field
                      TextField(
                        cursorColor: Theme.of(context).accentColor,
                        style: text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'State*',
                        ),
                      ),
                      spaceHeight,

                      ///Passport Image and Upload text
                      Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor)),
                                child: image),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Upload Valid Passport Photo',
                              style: subHeader,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FlatButton(
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () {
                                getImage();
                              },
                              child: Text(
                                "Upload",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      spaceHeight,
                      Center(
                        child: DottedBorder(
                          color: Theme.of(context).primaryColor,
                          strokeWidth: 1,
                          child: Container(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.fileUpload,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Formats: .PDF, .DOC, .JPG, .PNG'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('No file uploaded*'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Upload ID Card',
                                    style: subHeader,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FlatButton(
                                    color: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Upload File",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      spaceHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
