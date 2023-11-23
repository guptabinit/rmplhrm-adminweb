import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin.g.dart';

@JsonSerializable()
class Admin extends Equatable {
  const Admin({
    this.uid,
    this.email,
    this.password,
    this.branch,
    this.inTime,
    this.outTime,
    this.workingHours,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);

  Map<String, dynamic> toJson() => _$AdminToJson(this);

  static const empty = Admin(uid: '-');

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [
        uid,
        email,
        password,
        branch,
        inTime,
        outTime,
        workingHours,
      ];

  final String? uid;
  final String? email;
  final String? password;
  final String? branch;
  @JsonKey(name: 'in_time')
  final String? inTime;
  @JsonKey(name: 'out_time')
  final String? outTime;
  @JsonKey(name: 'working_hours')
  final String? workingHours;
}
