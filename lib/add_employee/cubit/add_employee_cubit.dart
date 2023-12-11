import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit({
    required EmployeeRepository employeeRepository,
  })  : _employeeRepository = employeeRepository,
        super(const AddEmployeeState());

  void employeeProfileImage(String? value) {
    final profileImage = RequiredImage.dirty(value);
    emit(
      state.copyWith(
        profilePicture: profileImage,
        isValid: Formz.validate([
          profileImage,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void employeeIdChanged(String? value) {
    final employeeId = EmployeeId.dirty(value);
    emit(
      state.copyWith(
        employeeId: employeeId,
        isValid: Formz.validate([
          state.profilePicture,
          employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void passwordChanged(String? value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void firstNameChanged(String? value) {
    final firstName = FirstName.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void lastNameChanged(String? value) {
    final lastName = LastName.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void dateOfBirthChanged(String? value) {
    final dateOfBirth = DateOfBirth.dirty(value);
    emit(
      state.copyWith(
        dateOfBirth: dateOfBirth,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void designationChanged(String? value) {
    final designation = Designation.dirty(value);
    emit(
      state.copyWith(
        designation: designation,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void dateJoinedChanged(String? value) {
    final dateJoined = DateJoined.dirty(value);
    emit(
      state.copyWith(
        dateJoined: dateJoined,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void fathersNameChanged(String? value) {
    final fathersName = FathersName.dirty(value);
    emit(
      state.copyWith(
        fathersName: fathersName,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void addressChanged(String? value) {
    final address = Address.dirty(value);
    emit(
      state.copyWith(
        address: address,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void emailChanged(String? value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void aadharCardChanged(String? value) {
    final aadharCard = AadharCard.dirty(value);
    emit(
      state.copyWith(
        aadharCard: aadharCard,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void panCardChanged(String? value) {
    final panCard = PanCard.dirty(value);
    emit(
      state.copyWith(
        panCard: panCard,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          panCard,
          state.basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void basicSalaryChanged(double? value) {
    final basicSalary = BasicSalary.dirty(value);
    emit(
      state.copyWith(
        basicSalary: basicSalary,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          basicSalary,
          state.hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void hraChanged(double? value) {
    final hra = HRA.dirty(value);
    emit(
      state.copyWith(
        hra: hra,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          hra,
          state.fieldWorkAllowance,
        ]),
      ),
    );
  }

  void fieldWorkAllowanceChanged(String? value) {
    final fieldWorkAllowance = FieldWorkAllowance.dirty(value);
    emit(
      state.copyWith(
        fieldWorkAllowance: fieldWorkAllowance,
        isValid: Formz.validate([
          state.profilePicture,
          state.employeeId,
          state.password,
          state.firstName,
          state.lastName,
          state.dateOfBirth,
          state.designation,
          state.dateJoined,
          state.fathersName,
          state.address,
          state.email,
          state.aadharCard,
          state.panCard,
          state.basicSalary,
          state.hra,
          fieldWorkAllowance,
        ]),
      ),
    );
  }

  Future<void> submit({
    required String creator,
    required String branch,
  }) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      await _employeeRepository.createEmployee(
        creator: creator,
        eid: state.employeeId.value!,
        password: state.password.value!,
        branch: branch,
        firstName: state.firstName.value!,
        lastName: state.lastName.value!,
        dob: DateTime.parse(state.dateOfBirth.value!),
        designation: state.designation.value!,
        dateJoined: DateTime.parse(state.dateJoined.value!),
        fathersName: state.fathersName.value!,
        address: state.address.value!,
        email: state.email.value!,
        aadharNumber: state.aadharCard.value!,
        panNumber: state.panCard.value!,
        basicSalary: state.basicSalary.value!,
        hra: state.hra.value!,
        fieldWorkAllowance: state.fieldWorkAllowance.value!,
        file: File(state.profilePicture.value!),
      );
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  final EmployeeRepository _employeeRepository;
}
