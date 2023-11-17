part of 'holidays_bloc.dart';

sealed class HolidaysState extends Equatable {
  const HolidaysState();
  
  @override
  List<Object> get props => [];
}

final class HolidaysInitial extends HolidaysState {}
