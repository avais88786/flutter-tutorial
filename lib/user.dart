import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable:true)
class User {
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

  // Map toJson(){
  //   Map map = new Map();
  //   map["firstName"] = firstName;
  //   return map;
  // }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  save(context) {

    Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(toJson()['firstName'])));
  }
}
