import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  static const String ROUTENAME = '/listwidget';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Lists Demo'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Short'),
                Tab(text: 'Horizontal'),
                Tab(text: 'Long'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text('Mail'),
                    subtitle: Text('Subtitle Mail'),
                  ),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text('Map'),
                    subtitle: Text('Subtitle Map'),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text('Contact Mail'),
                    subtitle: Text('Subtitle Contact Mail'),
                  ),
                  ListTile(
                    leading: Icon(Icons.desktop_mac),
                    title: Text('Macbook'),
                    subtitle: Text('Subtitle Desktop Mac'),
                  ),
                ],
              ),
              ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                      width: 160,
                      child: ListTile(
                        leading: Icon(Icons.mail),
                        title: Text('Mail'),
                        subtitle: Text('Subtitle Mail'),
                      )),
                  Container(
                      width: 160,
                      child: ListTile(
                        leading: Icon(Icons.map),
                        title: Text('Map'),
                        subtitle: Text('Subtitle Map'),
                      )),
                  Container(
                      width: 160,
                      child: ListTile(
                        leading: Icon(Icons.contact_mail),
                        title: Text('Contact Mail'),
                        subtitle: Text('Subtitle Contact Mail'),
                      )),
                  Container(
                      width: 160,
                      child: ListTile(
                        leading: Icon(Icons.desktop_mac),
                        title: Text('Macbook'),
                        subtitle: Text('Subtitle Desktop Mac'),
                      )),
                  Container(
                      width: 160,
                      child: ListTile(
                        leading: Icon(Icons.mail),
                        title: Text('Mail2'),
                        subtitle: Text('Subtitle Mail - 2'),
                      )),
                  Container(
                      width: 160,
                      child: ListTile(
                        leading: Icon(Icons.map),
                        title: Text('Map2'),
                        subtitle: Text('Subtitle Map - 2'),
                      )),
                  Container(
                      width: 160,
                      child: ListTile(
                        leading: Icon(Icons.contact_mail),
                        title: Text('Contact Mail2'),
                        subtitle: Text('Subtitle Contact Mail - 2'),
                      )),
                  Container(
                      width: 160,
                      child: ListTile(
                        leading: Icon(Icons.desktop_mac),
                        title: Text('Macbook2'),
                        subtitle: Text('Subtitle Desktop Mac - 2'),
                      )),
                ],
              ),
              ListView.builder(
                itemCount: 10000,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item - $index'),
                    subtitle: Text('Subtitle Item - $index'),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
