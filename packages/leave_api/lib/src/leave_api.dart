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

  Future<void> updateLeave({
    required String id,
    String? status,
    String? reason,
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

class UpdateLeaveFailure implements Exception {
  const UpdateLeaveFailure([
    this.message = 'Failed to update leave',
  ]);

  factory UpdateLeaveFailure.fromCode(String code) {
    switch (code) {
      case 'not_found':
        return const UpdateLeaveFailure(
          'Leave not found',
        );
      default:
        throw const UpdateLeaveFailure();
    }
  }

  final String message;
}
