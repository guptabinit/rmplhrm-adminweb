import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';

part 'leave.g.dart';

@JsonSerializable()
@DocumentReferenceConverter()
@TimestampConverter()
class Leave extends Equatable {
  const Leave({
    this.user,
    this.reason,
    this.date,
    this.fromDate,
    this.toDate,
    this.status,
    this.leaveType,
    this.createdAt,
  });

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveToJson(this);

  @override
  List<Object?> get props => [
        user,
        reason,
        date,
        fromDate,
        toDate,
        status,
        leaveType,
        createdAt,
      ];

  @JsonKey(name: 'uid')
  final DocumentReference? user;
  final String? reason;
  final DateTime? date;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? status;
  final String? leaveType;
  final DateTime? createdAt;
}
