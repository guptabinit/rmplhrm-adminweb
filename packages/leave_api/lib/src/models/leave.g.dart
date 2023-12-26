// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leave _$LeaveFromJson(Map<String, dynamic> json) => Leave(
      user: const DocumentReferenceConverter().fromJson(json['uid']),
      reason: json['reason'] as String?,
      id: json['id'] as String?,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp?),
      fromDate:
          const TimestampConverter().fromJson(json['fromDate'] as Timestamp?),
      toDate: const TimestampConverter().fromJson(json['toDate'] as Timestamp?),
      status: json['status'] as String?,
      leaveType: json['leaveType'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      under: const DocumentReferenceConverter().fromJson(json['under']),
    );

Map<String, dynamic> _$LeaveToJson(Leave instance) => <String, dynamic>{
      'uid': const DocumentReferenceConverter().toJson(instance.user),
      'under': const DocumentReferenceConverter().toJson(instance.under),
      'id': instance.id,
      'reason': instance.reason,
      'date': const TimestampConverter().toJson(instance.date),
      'fromDate': const TimestampConverter().toJson(instance.fromDate),
      'toDate': const TimestampConverter().toJson(instance.toDate),
      'status': instance.status,
      'leaveType': instance.leaveType,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
