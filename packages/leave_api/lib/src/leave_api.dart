import 'package:leave_api/src/models/models.dart';

abstract class LeaveApi {
  const LeaveApi();

  Stream<List<Leave>> getLeaves({
    required DateTime date,
    required String under,
  });

  Future<Leave> getLeave({
    required String id,
  });
}

class FetchLeaveFailure implements Exception {
  const FetchLeaveFailure([
    this.message = 'Failed to fetch leave',
  ]);

  factory FetchLeaveFailure.fromCode(String code) {
    switch (code) {
      case 'not_found':
        return const FetchLeaveFailure(
          'Leave not found',
        );
      default:
        throw const FetchLeaveFailure();
    }
  }

  final String message;
}
