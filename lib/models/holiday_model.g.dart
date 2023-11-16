// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidayModel _$HolidayModelFromJson(Map<String, dynamic> json) => HolidayModel(
      id: json['id'] as String?,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp?),
      title: json['title'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$HolidayModelToJson(HolidayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const TimestampConverter().toJson(instance.date),
      'title': instance.title,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
