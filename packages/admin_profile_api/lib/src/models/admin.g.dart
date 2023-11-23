// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      branch: json['branch'] as String?,
      inTime: json['in_time'] as String?,
      outTime: json['out_time'] as String?,
      workingHours: json['working_hours'] as String?,
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'branch': instance.branch,
      'in_time': instance.inTime,
      'out_time': instance.outTime,
      'working_hours': instance.workingHours,
    };
