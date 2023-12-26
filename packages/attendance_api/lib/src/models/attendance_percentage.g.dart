// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_percentage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendancePercentage _$AttendancePercentageFromJson(
        Map<String, dynamic> json) =>
    AttendancePercentage(
      present: json['present'] as int? ?? 0,
      absent: json['absent'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$AttendancePercentageToJson(
        AttendancePercentage instance) =>
    <String, dynamic>{
      'present': instance.present,
      'absent': instance.absent,
      'total': instance.total,
    };
