import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_employee_profile_state.dart';

class UpdateEmployeeProfileCubit extends Cubit<UpdateEmployeeProfileState> {
  UpdateEmployeeProfileCubit() : super(const UpdateEmployeeProfileState());
}
