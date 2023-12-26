import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api/employee_api.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';

part 'attendance.g.dart';

@JsonSerializable()
@DocumentReferenceConverter()
@TimestampConverter()
class Attendance extends Equatable {
  const Attendance({
    this.punchedBy,
    this.punchedIn,
    this.punchedOut,
    this.createdAt,
    this.employee,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  Attendance copyWith({
    DocumentReference? punchedBy,
    DateTime? punchedIn,
    DateTime? punchedOut,
    DateTime? createdAt,
    Employee? employee,
  }) =>
      Attendance(
        punchedBy: punchedBy ?? this.punchedBy,
        punchedIn: punchedIn ?? this.punchedIn,
        punchedOut: punchedOut ?? this.punchedOut,
        createdAt: createdAt ?? this.createdAt,
        employee: employee ?? this.employee,
      );

  static const empty = Attendance(employee: Employee.empty);

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [
        punchedBy,
        punchedIn,
        punchedOut,
        createdAt,
        employee,
      ];

  final DocumentReference? punchedBy;
  final DateTime? punchedIn;
  final DateTime? punchedOut;
  final DateTime? createdAt;
  final Employee? employee;
}
