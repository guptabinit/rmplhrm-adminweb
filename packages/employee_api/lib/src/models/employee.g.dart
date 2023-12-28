// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      salaryDetails: (json['salaryDetails'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry(k, SalaryDetail.fromJson(e as Map<String, dynamic>)),
            )),
      ),
      aadharNumber: json['aadharNumber'] as String?,
      address: json['address'] as String?,
      basicSalary: (json['basicSalary'] as num?)?.toDouble(),
      branch: json['branch'] as String?,
      dateJoined:
          const TimestampConverter().fromJson(json['dateJoined'] as Timestamp?),
      designation: json['designation'] as String?,
      dob: const TimestampConverter().fromJson(json['dob'] as Timestamp?),
      eid: json['eid'] as String?,
      fathersName: json['fathersName'] as String?,
      fieldWorkAllowance: json['fieldWorkAllowance'] as String?,
      firstName: json['firstName'] as String?,
      hra: (json['hra'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool?,
      lastName: json['lastName'] as String?,
      panNumber: json['panNumber'] as String?,
      password: json['password'] as String?,
      probation: json['probation'] as bool?,
      probationTill: const TimestampConverter()
          .fromJson(json['probationTill'] as Timestamp?),
      profilePic: json['profilePic'] as String?,
      uid: json['uid'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      creator: const DocumentReferenceConverter().fromJson(json['creator']),
      email: json['email'] as String?,
      tokens:
          (json['tokens'] as List<dynamic>?)?.map((e) => e as String?).toList(),
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
      'email': instance.email,
      'probation': instance.probation,
      'probationTill':
          const TimestampConverter().toJson(instance.probationTill),
      'profilePic': instance.profilePic,
      'uid': instance.uid,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'creator': const DocumentReferenceConverter().toJson(instance.creator),
      'salaryDetails': instance.salaryDetails,
      'tokens': instance.tokens,
    };

SalaryDetail _$SalaryDetailFromJson(Map<String, dynamic> json) => SalaryDetail(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SalaryDetailToJson(SalaryDetail instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'amount': instance.amount,
    };
