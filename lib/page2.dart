import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  @override
  _Page2State createState() => new _Page2State();
}

class _Page2State extends State<page2> {
  //don't wanna show !!
  void showSnack(BuildContext context) {
    final snackbar = SnackBar(
      content: Text("Snackbar here.."),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void showInButtom() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 100.0,
          color: Colors.green,
          child: Center(
            child: Text('This is a sheet Model'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Page 2"),
          elevation: 10.0,
        ),
        body: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MaterialButton(
                      child: Text('Snackbar'),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      onPressed: () {
                        showSnack(context);
                      },
                    ),
                    MaterialButton(
                      child: Text('Sheet Model'),
                      color: Colors.green,
                      textColor: Colors.white,
                      splashColor: Colors.green,
                      onPressed: () {
                        showInButtom();
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}