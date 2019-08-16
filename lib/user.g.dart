// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..passions = json['passions'] as Map<String, dynamic>
    ..newsletter = json['newsletter'] as bool;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'passions': instance.passions,
      'newsletter': instance.newsletter,
    };
