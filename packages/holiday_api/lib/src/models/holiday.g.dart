// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Holiday _$HolidayFromJson(Map<String, dynamic> json) => Holiday(
      id: json['id'] as String?,
      creator: const DocumentReferenceConverter().fromJson(json['creator']),
      date: const TimestampConverter().fromJson(json['date'] as Timestamp?),
      title: json['title'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$HolidayToJson(Holiday instance) => <String, dynamic>{
      'id': instance.id,
      'creator': const DocumentReferenceConverter().toJson(instance.creator),
      'date': const TimestampConverter().toJson(instance.date),
      'title': instance.title,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
