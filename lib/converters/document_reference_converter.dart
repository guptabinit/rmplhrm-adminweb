import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference?, Object?> {
  const DocumentReferenceConverter();

  @override
  DocumentReference? fromJson(Object? json) {
    return tryCast<DocumentReference>(json);
  }

  @override
  Object? toJson(DocumentReference? documentReference) => documentReference;
}

T? tryCast<T>(value) {
  return value == null ? null : value as T;
}
