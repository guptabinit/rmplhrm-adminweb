import 'package:admin_profile_api/admin_profile_api.dart';

class AdminProfileRepository {
  const AdminProfileRepository({
    required AdminProfileApi api,
  }) : _api = api;

  Future<Admin> getAdmin(String uid) => _api.getAdmin(uid);

  final AdminProfileApi _api;
}
