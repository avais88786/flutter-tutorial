import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tutorial/servies/IMapImplementor.dart';
import 'package:tutorial/servies/databasehelper-service.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true)
class User extends IMapImplementor<User> {
  static const String PassionCooking = 'cooking';
  static const String PassionHiking = 'hiking';
  static const String PassionTraveling = 'traveling';
  String firstName = '';
  String lastName = '';
  Map passions = {
    PassionCooking: false,
    PassionHiking: false,
    PassionTraveling: false
  };
  bool newsletter = false;

  User();

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.fromMap(Map<String, dynamic> map) {
    firstName = map['firstName'];
    lastName = map['lastName'];
    newsletter = map['newsletter'];
    passions[PassionCooking] = map['cooking'];
    passions[PassionHiking] = map['hiking'];
    passions[PassionTraveling] = map['travelling'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'newsletter': newsletter,
      'cooking': passions[PassionCooking],
      'hiking': passions[PassionHiking],
      'travelling': passions[PassionTraveling]
    };
  }

  save(context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text(toJson()['firstName'])));

    DatabaseHelperService.instance.create(this, 'USER').then((id) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(id.toString())));
    });
  }

  @override
  List<User> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }
}
