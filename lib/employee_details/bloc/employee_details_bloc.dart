import 'package:bloc/bloc.dart';
import 'package:employee_api/employee_api.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';

part 'employee_details_event.dart';
part 'employee_details_state.dart';

class EmployeeDetailsBloc
    extends Bloc<EmployeeDetailsEvent, EmployeeDetailsState> {
  EmployeeDetailsBloc({
    required EmployeeRepository employeeRepository,
  })  : _employeeRepository = employeeRepository,
        super(const EmployeeDetailsState()) {
    on<EmployeeDetailsFetched>(_fetchEmployeeDetails);
  }

  Future<void> _fetchEmployeeDetails(
    EmployeeDetailsFetched event,
    Emitter<EmployeeDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EmployeeDetailsStatus.loading,
      ),
    );
    await emit.forEach<List<Employee>>(
      _employeeRepository.getEmployees(
        creator: event.creator,
      ),
      onData: (employees) => state.copyWith(
        employees: employees,
        status: EmployeeDetailsStatus.success,
      ),
      onError: (_, __) {
        print(_);
        print(__);
        return state.copyWith(
          status: EmployeeDetailsStatus.failure,
        );
      },
    );
  }

  final EmployeeRepository _employeeRepository;
}
