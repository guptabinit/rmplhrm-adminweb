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
    this.adminReason,
    this.id,
    this.date,
    this.fromDate,
    this.toDate,
    this.status,
    this.leaveType,
    this.createdAt,
    this.under,
  });

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveToJson(this);

  static const empty = Leave(id: '-');

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [
        user,
        reason,
        id,
        date,
        fromDate,
        toDate,
        status,
        leaveType,
        createdAt,
        under,
        adminReason,
      ];

  @JsonKey(name: 'uid')
  final DocumentReference? user;
  final DocumentReference? under;
  final String? id;
  final String? reason;
  final String? adminReason;
  final DateTime? date;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? status;
  final String? leaveType;
  final DateTime? createdAt;
}
