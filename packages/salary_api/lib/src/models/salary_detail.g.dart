// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryDetail _$SalaryDetailFromJson(Map<String, dynamic> json) => SalaryDetail(
      amount: (json['amount'] as num?)?.toDouble(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      creator: const DocumentReferenceConverter().fromJson(json['creator']),
    );

Map<String, dynamic> _$SalaryDetailToJson(SalaryDetail instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'creator': const DocumentReferenceConverter().toJson(instance.creator),
    };
