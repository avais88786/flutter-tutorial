import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/models/user.dart';

class FormFieldsWidget extends StatefulWidget {
  static const String ROUTENAME = '/formfieldswidget';

  @override
  State<StatefulWidget> createState() {
    return FormFieldsWidgetState();
  }
}

//https://medium.com/flutter-community/realistic-forms-in-flutter-part-1-327929dfd6fd
class FormFieldsWidgetState extends State<FormFieldsWidget> {
  static const String ROUTENAME = '/formfieldswidget';
  var formKey = GlobalKey<FormState>();
  var user = new User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Builder(
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'First Name is required';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        //  setState(() {
                        user.firstName = value;
                        //});
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          final form = formKey.currentState;
                          if (form.validate()) {
                            form.save();
                            user.save(context);
                          } else {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('failed saving')));
                          }
                        },
                        child: Text('Save'),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
