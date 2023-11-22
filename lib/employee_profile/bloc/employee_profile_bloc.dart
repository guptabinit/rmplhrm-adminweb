import 'package:bloc/bloc.dart';
import 'package:employee_api/employee_api.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';

part 'employee_profile_event.dart';
part 'employee_profile_state.dart';

class EmployeeProfileBloc
    extends Bloc<EmployeeProfileEvent, EmployeeProfileState> {
  EmployeeProfileBloc({
    required EmployeeRepository employeeRepository,
  })  : _employeeRepository = employeeRepository,
        super(const EmployeeProfileState()) {
    on<LoadedEmployeeProfile>(_onLoadedEmployeeProfile);
  }

  Future<void> _onLoadedEmployeeProfile(
    LoadedEmployeeProfile event,
    Emitter<EmployeeProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EmployeeStatus.loading,
      ),
    );
    try {
      final employee = await _employeeRepository.getEmployee(
        event.uid,
      );
      emit(
        state.copyWith(
          status: EmployeeStatus.success,
          employee: employee,
        ),
      );
    } on EmployeeNotFoundFailure catch (e) {
      emit(
        state.copyWith(
          status: EmployeeStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: EmployeeStatus.failure,
        ),
      );
    }
  }

  final EmployeeRepository _employeeRepository;
}
