import 'package:flutter/material.dart';
import 'package:avs/constants.dart';

class CompanyInfoScreen extends StatefulWidget {
  @override
  _CompanyInfoScreenState createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends State<CompanyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: Theme.of(context).accentColor,
                style: text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Name',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: Theme.of(context).accentColor,
                style: text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Address',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: Theme.of(context).accentColor,
                style: text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Email',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: Theme.of(context).accentColor,
                style: text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Mobile',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: Theme.of(context).accentColor,
                style: text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Company Website',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Save Changes",
                        style: text,
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    OutlineButton(
                      borderSide: BorderSide(width: 1.0, color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {},
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
