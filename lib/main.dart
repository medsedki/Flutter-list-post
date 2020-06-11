import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/post.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  Future<List<Post>> getPost() async {
    var data = await http.get('https://jsonplaceholder.typicode.com/posts');
    var dataDecode = json.decode(data.body);

    print('Posts : $dataDecode');

    List<Post> postList = List();
    dataDecode.forEach((post) {
      String title = post['title'];
      //String body = post['body'];
      String body = post['body'].replaceAll(RegExp(r"\n"), " ");

      if (title.length > 30) {
        title = post['title'].substring(1, 28) + "...";
      }
      /*if (body.length > 150) {
        body = post['body'].substring(1, 150) + "...";
      }*/

      postList.add(Post(title, body));
    });

    return postList;
  }

  @override
  Widget build(BuildContext context) {
    getPost();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Get Posts List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
            future: getPost(),
            builder: (context, snapshot) {
              //test if the data doen't exist
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        //margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                snapshot.data[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              Text(
                                snapshot.data[index].body,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54),
                              ),
                              Divider(),
                              FlatButton(
                                child: Text('Read more..'),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      );

//                  return Card(
//                    child: Padding(
//                      padding: EdgeInsets.symmetric(vertical: 2.0),
//                      child: new Row(children: <Widget>[
//                        Padding(
//                          padding: EdgeInsets.symmetric(horizontal: 5.0),
//                        ),
//                        new SizedBox(
//                          width: 20.0,
//                        ),
//                        Container(
//                          //padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
//                          margin: EdgeInsets.all(2.0),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.stretch,
//                            children: <Widget>[
//                              Text(
//                                snapshot.data[index].title,
//                                style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: 20.0,
//                                  color: Colors.blueAccent,
//                                ),
//                              ),
//                              Text(
//                                snapshot.data[index].body,
//                                style: TextStyle(
//                                    fontSize: 15.0,
//                                    fontWeight: FontWeight.normal,
//                                    color: Colors.black54),
//                              ),
//                            ],
//                          ),
//
//                          /*Text(
//                          snapshot.data[index].body,
//                          style: TextStyle(
//                              fontSize: 15.0,
//                              fontWeight: FontWeight.normal,
//                              color: Colors.black54),
//                        ),*/
//                        ),
//                      ]),
//                    ),
//                  );
                    });
              } else {
                return Align(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
