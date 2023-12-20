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
    on<UpdateSalaryDetailAction>(_onUpdateSalaryDetail);
    on<SelectedEmployeeChangedEvent>(_onSelectedEmployeeChanged);
    on<UnselectedEmployeeChangedEvent>(_onUnselectedEmployeeChanged);
    on<SelectAllSalaryDetails>(_onSelectAllSalaryDetails);
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
          selectedEmployees: event.employees.toSet(),
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

  Future<void> _onUpdateSalaryDetail(
    UpdateSalaryDetailAction event,
    Emitter<UpdateSalaryDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: UpdateSalaryDetailsStatus.loading,
      ),
    );
    try {
      await _salaryRepository.updateSalary(
        employeeId: event.employee.uid!,
        amount: event.amount ??
            (event.employee.basicSalary ?? 0) + (event.employee.hra ?? 0),
      );
      emit(
        state.copyWith(
          status: UpdateSalaryDetailsStatus.success,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: UpdateSalaryDetailsStatus.failure,
        ),
      );
    }
  }

  Future<void> _onUnselectedEmployeeChanged(
    UnselectedEmployeeChangedEvent event,
    Emitter<UpdateSalaryDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        removeSalaryDetailsStatus: RemoveSalaryDetailsStatus.loading,
      ),
    );
    try {
      await _salaryRepository.removeSalary(
        employeeId: event.employee.uid!,
      );

      emit(
        state.copyWith(
          removeSalaryDetailsStatus: RemoveSalaryDetailsStatus.success,
          selectedEmployees: state.selectedEmployees
              .where(
                (element) => element.uid != event.employee.uid,
              )
              .toSet(),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          removeSalaryDetailsStatus: RemoveSalaryDetailsStatus.failure,
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

  void _onSelectAllSalaryDetails(
    SelectAllSalaryDetails event,
    Emitter<UpdateSalaryDetailsState> emit,
  ) {
    emit(
      state.copyWith(
        selectedEmployees: event.employees.toSet(),
      ),
    );
  }

  final SalaryRepository _salaryRepository;
}
