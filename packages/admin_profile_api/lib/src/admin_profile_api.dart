import 'package:admin_profile_api/admin_profile_api.dart';

abstract class AdminProfileApi {
  const AdminProfileApi();

  Future<Admin> getAdmin(String uid);
}

class AdminProfileNotFound implements Exception {
  const AdminProfileNotFound([
    this.message = 'Profile not found',
  ]);

  final String message;
}
