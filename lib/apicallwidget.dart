import 'package:flutter/material.dart';

import 'models/post.dart';
import 'package:http/http.dart' as http;

class ApiCallWidget extends StatefulWidget {
  static const String ROUTENAME = '/apicallwidget';

  @override
  State<StatefulWidget> createState() {
    return ApiCallState();
  }
}

class ApiCallState extends State<ApiCallWidget> {
  Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Calls'),
      ),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            // staggered grid view - https://github.com/letsar/flutter_staggered_grid_view
            return GridView.count(
              padding: EdgeInsets.all(5),
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.8,
              children: List.generate(snapShot.data.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(snapShot.data[index].id.toString()),
                          Text(snapShot.data[index].userId.toString()),
                        ],
                      ),
                      Divider(),
                      Text(snapShot.data[index].title),
                      Divider(),
                      Container(
                        height: 30,
                        child: Text(
                          snapShot.data[index].body,
                          overflow: TextOverflow.visible,
                        ),
                      )
                    ],
                  ),
                );
              }),
            );
          } else if (snapShot.hasError) {
            return Center(
              child: Text(
                snapShot.error.toString(),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        },
      ),
    );
  }

  Future<List<Post>> fetchPosts() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      return Future.delayed(const Duration(seconds: 2), () {
        return postFromJson(response.body);
      });
    } else {
      throw new Exception('API call error');
    }
  }
}
