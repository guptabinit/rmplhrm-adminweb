import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rmpl_hrm_admin/converters/document_reference_converter.dart';
import 'package:rmpl_hrm_admin/converters/timestamp_converter.dart';

part 'holiday_model.g.dart';

@JsonSerializable()
@DocumentReferenceConverter()
@TimestampConverter()
class HolidayModel extends Equatable {
  const HolidayModel({
    this.id,
    this.date,
    this.title,
    this.createdAt,
  });

  factory HolidayModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayModelFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayModelToJson(this);

  final String? id;
  final DateTime? date;
  final String? title;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [id, date, title, createdAt];
}
