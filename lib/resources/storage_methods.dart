import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // adding image to firebase storage
  Future<String> uploadImageToStorage({required String uid, required Uint8List file}) async {

    final ref = _storage.ref().child('profile_pic').child(uid);

    final uploadTask = ref.putData(file);

    final snap = await uploadTask;

    final downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

}