// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      punchedBy: const DocumentReferenceConverter().fromJson(json['punchedBy']),
      punchedIn:
          const TimestampConverter().fromJson(json['punchedIn'] as Timestamp?),
      punchedOut:
          const TimestampConverter().fromJson(json['punchedOut'] as Timestamp?),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      employee: json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'punchedBy':
          const DocumentReferenceConverter().toJson(instance.punchedBy),
      'punchedIn': const TimestampConverter().toJson(instance.punchedIn),
      'punchedOut': const TimestampConverter().toJson(instance.punchedOut),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'employee': instance.employee,
    };
