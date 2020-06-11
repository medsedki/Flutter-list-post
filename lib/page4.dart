import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class page4 extends StatefulWidget {
  @override
  _UseSharedPrefState createState() => new _UseSharedPrefState();
}

class _UseSharedPrefState extends State<page4> {
  String input, username;

  @override
  void initState() {
    super.initState();
    getSharedPref();
  }

  Future<Null> storeInput(String input) async {
    await SharedPreferences.getInstance().then((value) {
      setState(() {
        value.setString("username", input);
        username = input;
      });
    });
  }

  Future<Null> getSharedPref() async {
    await SharedPreferences.getInstance().then((prefs) {
      setState(() {
        username = prefs.get("username");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text(username == null ? "No Name" : username),
            elevation: 10.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: "Enter Name", hintText: "Name"),
                  onChanged: (String val) {
                    input = val;
                  },
                ),
                FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    'Save Username',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      storeInput(input);
                    });
                  },
                )
              ],
            ),
          )),
    );
  }
}
