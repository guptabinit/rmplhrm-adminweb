// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      aadharNumber: json['aadharNumber'] as String?,
      address: json['address'] as String?,
      basicSalary: json['basicSalary'] as String?,
      branch: json['branch'] as String?,
      dateJoined:
          const TimestampConverter().fromJson(json['dateJoined'] as Timestamp?),
      designation: json['designation'] as String?,
      dob: const TimestampConverter().fromJson(json['dob'] as Timestamp?),
      eid: json['eid'] as String?,
      fathersName: json['fathersName'] as String?,
      fieldWorkAllowance: json['fieldWorkAllowance'] as String?,
      firstName: json['firstName'] as String?,
      hra: json['hra'] as String?,
      isActive: json['isActive'] as bool?,
      lastName: json['lastName'] as String?,
      panNumber: json['panNumber'] as String?,
      password: json['password'] as String?,
      probation: json['probation'] as bool?,
      probationTill: const TimestampConverter()
          .fromJson(json['probationTill'] as Timestamp?),
      profileUrl: json['profileUrl'] as String?,
      uid: json['uid'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      creator: const DocumentReferenceConverter().fromJson(json['creator']),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'aadharNumber': instance.aadharNumber,
      'address': instance.address,
      'basicSalary': instance.basicSalary,
      'branch': instance.branch,
      'dateJoined': const TimestampConverter().toJson(instance.dateJoined),
      'designation': instance.designation,
      'dob': const TimestampConverter().toJson(instance.dob),
      'eid': instance.eid,
      'fathersName': instance.fathersName,
      'fieldWorkAllowance': instance.fieldWorkAllowance,
      'firstName': instance.firstName,
      'hra': instance.hra,
      'isActive': instance.isActive,
      'lastName': instance.lastName,
      'panNumber': instance.panNumber,
      'password': instance.password,
      'probation': instance.probation,
      'probationTill':
          const TimestampConverter().toJson(instance.probationTill),
      'profileUrl': instance.profileUrl,
      'uid': instance.uid,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'creator': const DocumentReferenceConverter().toJson(instance.creator),
    };
