import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';
import 'package:leave_api/leave_api.dart';

part 'leave.g.dart';

@JsonSerializable()
@DocumentReferenceConverter()
@TimestampConverter()
class Leave extends Equatable {
  const Leave({
    this.uid,
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

  Leave copyWith({
    DocumentReference? uid,
    User? user,
    String? reason,
    String? id,
    DateTime? date,
    DateTime? fromDate,
    DateTime? toDate,
    String? status,
    String? leaveType,
    DateTime? createdAt,
    DocumentReference? under,
    String? adminReason,
  }) {
    return Leave(
      uid: uid ?? this.uid,
      user: user ?? this.user,
      reason: reason ?? this.reason,
      id: id ?? this.id,
      date: date ?? this.date,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      status: status ?? this.status,
      leaveType: leaveType ?? this.leaveType,
      createdAt: createdAt ?? this.createdAt,
      under: under ?? this.under,
      adminReason: adminReason ?? this.adminReason,
    );
  }

  @override
  List<Object?> get props => [
        uid,
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

  final DocumentReference? uid;
  final User? user;
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
