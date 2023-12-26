import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance_count.g.dart';

@JsonSerializable()
class AttendanceCount extends Equatable {
  const AttendanceCount({
    this.total = 0,
    this.present = 0,
    this.absent = 0,
  });

  factory AttendanceCount.fromJson(Map<String, dynamic> json) =>
      _$AttendanceCountFromJson(json);

  AttendanceCount copyWith({
    int? total,
    int? present,
    int? absent,
  }) {
    return AttendanceCount(
      total: total ?? this.total,
      present: present ?? this.present,
      absent: absent ?? this.absent,
    );
  }

  static const empty = AttendanceCount();

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [
        total,
        present,
        absent,
      ];

  final int total;
  final int present;
  final int absent;
}
