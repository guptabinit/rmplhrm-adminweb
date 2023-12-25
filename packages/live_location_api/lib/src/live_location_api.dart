import 'package:live_location_api/live_location_api.dart';

abstract class LiveLocationApi {
  const LiveLocationApi();

  Stream<Location?> lastLocation({
    required String userId,
  });
}
