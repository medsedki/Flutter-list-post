import 'package:flutter/material.dart';

class page5 extends StatefulWidget {
  @override
  _SliversAppBarState createState() => new _SliversAppBarState();
}

class _SliversAppBarState extends State<page5> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              //the height you see when you scrolled dwon
              expandedHeight: 200,
              //make the appBar stay when scroll down
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Slivers'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "$index",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
