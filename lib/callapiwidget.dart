import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/post.dart';

class CallApiWidget extends StatefulWidget {
  static const String ROUTENAME = '/callapiwidget';

  @override
  State<StatefulWidget> createState() {
    return CallApiState();
  }
}

class CallApiState extends State<CallApiWidget> {
  Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    try {
      var response =
          await http.get('https://jsonplaceholder.typicode.com/posts');

      print('Avais I got response');
      if (response.statusCode == 200) {
        return new Future.delayed(const Duration(seconds: 2), () {
          return postFromJson(response.body);
        });
        // new Timer(const Duration(seconds: 2), () {
        //   return postFromJson(response.body);
        // });
      } else {
        throw Exception('Call API failed');
      }
    } catch (exception) {
      print('Avais I failed');
      throw exception;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get API',
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return Text(postToJson(snapshot.data));
            return Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(snapshot.data.length, (index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(snapshot.data[index].id.toString()),
                            Text(snapshot.data[index].userId.toString()),
                          ],
                        ),
                        Text(snapshot.data[index].title),
                        Expanded(
                          child: Text(
                            snapshot.data[index].body,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
