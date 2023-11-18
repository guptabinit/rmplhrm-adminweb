import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';

part 'holiday.g.dart';

@JsonSerializable()
@DocumentReferenceConverter()
@TimestampConverter()
class Holiday extends Equatable {
  const Holiday({
    this.id,
    this.creator,
    this.date,
    this.title,
    this.createdAt,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayToJson(this);

  final String? id;
  final DocumentReference? creator;
  final DateTime? date;
  final String? title;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [id, creator, date, title, createdAt];
}
