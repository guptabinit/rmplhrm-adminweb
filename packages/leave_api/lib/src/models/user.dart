import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_converter/json_converter.dart';

part 'user.g.dart';

@JsonSerializable()
@DocumentReferenceConverter()
class User extends Equatable {
  const User({
    this.firstName,
    this.lastName,
    this.email,
    this.uid,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? uid,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        uid,
      ];

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? uid;
}
