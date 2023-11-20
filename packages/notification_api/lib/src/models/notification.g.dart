// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      branch: json['branch'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      isVisible: json['isVisible'] as bool?,
      message: json['message'] as String?,
      id: json['id'] as String?,
      receiver: json['receiver'] as String?,
      type: json['type'] as String?,
      creator: const DocumentReferenceConverter().fromJson(json['creator']),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'isVisible': instance.isVisible,
      'message': instance.message,
      'id': instance.id,
      'receiver': instance.receiver,
      'type': instance.type,
      'creator': const DocumentReferenceConverter().toJson(instance.creator),
    };
