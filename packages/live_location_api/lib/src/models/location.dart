import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';

part 'location.g.dart';

@JsonSerializable()
@TimestampConverter()
class Location {
  const Location({
    this.latitude,
    this.longitude,
    this.timestamp,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final double? latitude;
  final double? longitude;
  final DateTime? timestamp;
}
