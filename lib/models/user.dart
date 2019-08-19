import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tutorial/servies/IMapImplementor.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true)
class User extends IMapImplementor{
  
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
  }
}
