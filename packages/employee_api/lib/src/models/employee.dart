import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, Timestamp;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';

part 'employee.g.dart';

@JsonSerializable()
@TimestampConverter()
@DocumentReferenceConverter()
class Employee extends Equatable {
  const Employee({
    this.aadharNumber,
    this.address,
    this.basicSalary,
    this.branch,
    this.dateJoined,
    this.designation,
    this.dob,
    this.eid,
    this.fathersName,
    this.fieldWorkAllowance,
    this.firstName,
    this.hra,
    this.isActive,
    this.lastName,
    this.panNumber,
    this.password,
    this.probation,
    this.probationTill,
    this.profilePic,
    this.uid,
    this.createdAt,
    this.creator,
    this.email,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  static const empty = Employee(uid: '-');

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [
        aadharNumber,
        address,
        basicSalary,
        branch,
        dateJoined,
        designation,
        dob,
        eid,
        fathersName,
        fieldWorkAllowance,
        firstName,
        hra,
        email,
        isActive,
        lastName,
        panNumber,
        password,
        probation,
        probationTill,
        profilePic,
        uid,
        createdAt,
        creator,
      ];

  final String? aadharNumber;
  final String? address;
  final double? basicSalary;
  final String? branch;
  final DateTime? dateJoined;
  final String? designation;
  final DateTime? dob;
  final String? eid;
  final String? fathersName;
  final String? fieldWorkAllowance;
  final String? firstName;
  final String? hra;
  final bool? isActive;
  final String? lastName;
  final String? panNumber;
  final String? password;
  final String? email;
  final bool? probation;
  final DateTime? probationTill;
  final String? profilePic;
  final String? uid;
  final DateTime? createdAt;
  final DocumentReference? creator;
}
