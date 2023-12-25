import 'package:live_location_api/live_location_api.dart';

class LiveLocationRepository {
  const LiveLocationRepository({
    required LiveLocationApi api,
  }) : _api = api;

  Stream<Location?> lastLocation({
    required String userId,
  }) =>
      _api.lastLocation(
        userId: userId,
      );

  final LiveLocationApi _api;
}
