import 'package:bloc/bloc.dart';
import 'package:employee_api/employee_api.dart';
import 'package:equatable/equatable.dart';
import 'package:salary_repository/salary_repository.dart';

part 'update_salary_details_event.dart';
part 'update_salary_details_state.dart';

class UpdateSalaryDetailsBloc
    extends Bloc<UpdateSalaryDetailsEvent, UpdateSalaryDetailsState> {
  UpdateSalaryDetailsBloc({
    required SalaryRepository salaryRepository,
  })  : _salaryRepository = salaryRepository,
        super(const UpdateSalaryDetailsState()) {
    on<UpdateSalaryDetailsAction>(_onUpdateSalaryDetails);
    on<SelectedEmployeeChangedEvent>(_onSelectedEmployeeChanged);
  }

  Future<void> _onUpdateSalaryDetails(
    UpdateSalaryDetailsAction event,
    Emitter<UpdateSalaryDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: UpdateSalaryDetailsStatus.loading,
      ),
    );
    try {
      final queries = event.employees.map((e) {
        return _salaryRepository.updateSalary(
          employeeId: e.uid!,
          amount: (e.basicSalary ?? 0) + (e.hra ?? 0),
        );
      });
      await Future.wait(queries);
      emit(
        state.copyWith(
          status: UpdateSalaryDetailsStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UpdateSalaryDetailsStatus.failure,
        ),
      );
    }
  }

  void _onSelectedEmployeeChanged(
    SelectedEmployeeChangedEvent event,
    Emitter<UpdateSalaryDetailsState> emit,
  ) {
    emit(
      state.copyWith(
        selectedEmployees: {
          ...state.selectedEmployees,
          event.employee,
        },
      ),
    );
  }

  final SalaryRepository _salaryRepository;
}
