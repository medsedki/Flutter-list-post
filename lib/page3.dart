import 'package:flutter/material.dart';

class page3 extends StatefulWidget {
  @override
  _PageViewState createState() => new _PageViewState();
}

class _PageViewState extends State<page3> {
  Widget buildPage(String text, Color color) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 70.0, color: color),
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
      children: <Widget>[
        buildPage("Page 1", Colors.red),
        buildPage("Page 2", Colors.redAccent),
        buildPage("Page 3", Colors.deepOrange),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("PageView"),
          elevation: 10.0,
        ),
        body: buildPageView(),
      ),
    );
  }

/*@override
  Widget build(BuildContext context) {
    return Material(
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("PageView"),
          elevation: 10.0,
        ),
        body: PageView(
          children: <Widget>[
            page2(),
            Text("eeeeeeee"),
          ],
        ),
      ),
    );
  }*/
}
