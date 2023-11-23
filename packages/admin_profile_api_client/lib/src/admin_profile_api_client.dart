import 'package:admin_profile_api/admin_profile_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProfileApiClient implements AdminProfileApi {
  const AdminProfileApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<Admin> getAdmin(String uid) async {
    try {
      final doc = await _firestore.collection('admin').doc(uid).get();
      if (!doc.exists) throw const AdminProfileNotFound();
      return Admin.fromJson(doc.data()!);
    } catch (_) {
      throw const AdminProfileNotFound();
    }
  }

  final FirebaseFirestore _firestore;
}
