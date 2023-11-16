import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? timestamp) => timestamp?.toDate();

  @override
  Timestamp? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
  // @override
  // Timestamp? fromJson(DateTime? date) =>
  //     date == null ? null : Timestamp.fromDate(date);

  // @override
  // DateTime? toJson(Timestamp? timestamp) => timestamp?.toDate();
}
