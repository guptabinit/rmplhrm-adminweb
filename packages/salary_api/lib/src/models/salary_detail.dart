import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';

part 'salary_detail.g.dart';

@JsonSerializable()
@TimestampConverter()
@DocumentReferenceConverter()
class SalaryDetail {
  const SalaryDetail({
    this.amount,
    this.createdAt,
    this.creator,
  });

  factory SalaryDetail.fromJson(Map<String, dynamic> json) =>
      _$SalaryDetailFromJson(json);

  final double? amount;
  final DateTime? createdAt;
  final DocumentReference? creator;
}

class SalaryDetailUpdateFailure implements Exception {
  const SalaryDetailUpdateFailure([
    this.message = 'Something went wrong',
  ]);

  factory SalaryDetailUpdateFailure.fromCode(String code) {
    switch (code) {
      case 'failed_precondition':
        return const SalaryDetailUpdateFailure('The query requires an index.');
      case 'not-found':
        return const SalaryDetailUpdateFailure('The document does not exist.');
      default:
        return const SalaryDetailUpdateFailure();
    }
  }

  final String message;
}
