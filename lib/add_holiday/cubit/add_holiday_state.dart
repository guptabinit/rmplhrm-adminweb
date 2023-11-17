part of 'add_holiday_cubit.dart';

final class AddHolidayState extends Equatable {
  const AddHolidayState({
    this.date = const Date.pure(),
    this.title = const HolidayTitle.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Date date;
  final HolidayTitle title;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  AddHolidayState copyWith({
    Date? date,
    HolidayTitle? title,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      AddHolidayState(
        date: date ?? this.date,
        title: title ?? this.title,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  String toString() => 'AddHolidayState{date: $date, '
      'title: $title, '
      'status: $status, '
      'isValid: $isValid, '
      'errorMessage: $errorMessage}';

  @override
  List<Object?> get props => [
        date,
        title,
        status,
        isValid,
        errorMessage,
      ];
}
