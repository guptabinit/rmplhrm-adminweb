import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(const RootState());

  void navigateTo(AppRoute route) => emit(
        RootState(
          route: route,
        ),
      );
}