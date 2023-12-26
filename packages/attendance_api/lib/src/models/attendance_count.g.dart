// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceCount _$AttendanceCountFromJson(Map<String, dynamic> json) =>
    AttendanceCount(
      total: json['total'] as int? ?? 0,
      present: json['present'] as int? ?? 0,
      absent: json['absent'] as int? ?? 0,
    );

Map<String, dynamic> _$AttendanceCountToJson(AttendanceCount instance) =>
    <String, dynamic>{
      'total': instance.total,
      'present': instance.present,
      'absent': instance.absent,
    };
