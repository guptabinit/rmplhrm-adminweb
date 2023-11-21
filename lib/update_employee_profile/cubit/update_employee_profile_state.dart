part of 'update_employee_profile_cubit.dart';

final class UpdateEmployeeProfileState extends Equatable {
  const UpdateEmployeeProfileState({
    this.employeeId = const EmployeeId.pure(),
    this.password = const Password.pure(),
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.dateOfBirth = const DateOfBirth.pure(),
    this.designation = const Designation.pure(),
    this.dateJoined = const DateJoined.pure(),
    this.fathersName = const FathersName.pure(),
    this.address = const Address.pure(),
    this.email = const Email.pure(),
    this.aadharCard = const AadharCard.pure(),
    this.panCard = const PanCard.pure(),
    this.basicSalary = const BasicSalary.pure(),
    this.hra = const HRA.pure(),
    this.fieldWorkAllowance = const FieldWorkAllowance.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  UpdateEmployeeProfileState copyWith({
    EmployeeId? employeeId,
    Password? password,
    FirstName? firstName,
    LastName? lastName,
    DateOfBirth? dateOfBirth,
    Designation? designation,
    DateJoined? dateJoined,
    FathersName? fathersName,
    Address? address,
    Email? email,
    AadharCard? aadharCard,
    PanCard? panCard,
    BasicSalary? basicSalary,
    HRA? hra,
    FieldWorkAllowance? fieldWorkAllowance,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return UpdateEmployeeProfileState(
      employeeId: employeeId ?? this.employeeId,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      designation: designation ?? this.designation,
      dateJoined: dateJoined ?? this.dateJoined,
      fathersName: fathersName ?? this.fathersName,
      address: address ?? this.address,
      email: email ?? this.email,
      aadharCard: aadharCard ?? this.aadharCard,
      panCard: panCard ?? this.panCard,
      basicSalary: basicSalary ?? this.basicSalary,
      hra: hra ?? this.hra,
      fieldWorkAllowance: fieldWorkAllowance ?? this.fieldWorkAllowance,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        employeeId,
        password,
        firstName,
        lastName,
        dateOfBirth,
        designation,
        dateJoined,
        fathersName,
        address,
        email,
        aadharCard,
        panCard,
        basicSalary,
        hra,
        fieldWorkAllowance,
        isValid,
        errorMessage,
        status,
      ];

  final EmployeeId employeeId;
  final Password password;
  final FirstName firstName;
  final LastName lastName;
  final DateOfBirth dateOfBirth;
  final Designation designation;
  final DateJoined dateJoined;
  final FathersName fathersName;
  final Address address;
  final Email email;
  final AadharCard aadharCard;
  final PanCard panCard;
  final BasicSalary basicSalary;
  final HRA hra;
  final FieldWorkAllowance fieldWorkAllowance;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
}
