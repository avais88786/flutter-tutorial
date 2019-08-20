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
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                      child: Text('Subscribe'),
                    ),
                    SwitchListTile(
                      title: Text('Monthly Newsletter'),
                      value: user.newsletter,
                      onChanged: (val) {
                        setState(() {
                          user.newsletter = val;
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                      child: Text('Interests'),
                    ),
                    CheckboxListTile(
                      title: Text(User.PassionCooking),
                      value: user.passions[User.PassionCooking],
                      onChanged: (val) {
                        setState(() {
                          user.passions[User.PassionCooking] = val;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(User.PassionHiking),
                      value: user.passions[User.PassionHiking],
                      onChanged: (val) {
                        setState(() {
                          user.passions[User.PassionHiking] = val;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(User.PassionTraveling),
                      value: user.passions[User.PassionTraveling],
                      onChanged: (val) {
                        setState(() {
                          user.passions[User.PassionTraveling] = val;
                        });
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
