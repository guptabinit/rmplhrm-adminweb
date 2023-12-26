import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance_percentage.g.dart';

@JsonSerializable()
class AttendancePercentage extends Equatable {
  const AttendancePercentage({
    this.present = 0,
    this.absent = 0,
    this.total = 0,
  });

  factory AttendancePercentage.fromJson(Map<String, dynamic> json) =>
      _$AttendancePercentageFromJson(json);

  static const AttendancePercentage empty = AttendancePercentage();

  AttendancePercentage copyWith({
    int? present,
    int? absent,
    int? total,
  }) {
    return AttendancePercentage(
      present: present ?? this.present,
      absent: absent ?? this.absent,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [
        present,
        absent,
        total,
      ];

  final int present;
  final int absent;
  final int total;
}
