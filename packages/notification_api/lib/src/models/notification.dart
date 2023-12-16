import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, Timestamp;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';

part 'notification.g.dart';

@JsonSerializable()
@DocumentReferenceConverter()
@TimestampConverter()
class Notification extends Equatable {
  const Notification({
    this.branch,
    this.createdAt,
    this.isVisible,
    this.message,
    this.id,
    this.receiver,
    this.type,
    this.creator,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  static const empty = Notification(id: '-');

  bool get isEmpty => empty == this;

  @override
  List<Object?> get props => [
        branch,
        createdAt,
        isVisible,
        message,
        id,
        receiver,
        type,
        creator,
      ];

  final String? branch;
  final DateTime? createdAt;
  final bool? isVisible;
  final String? message;
  final String? id;
  final String? receiver;
  final String? type;
  final DocumentReference? creator;
}
