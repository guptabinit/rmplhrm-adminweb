import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void onLoaded() {
    Future.delayed(
      const Duration(seconds: 2),
      () => emit(
        state.copyWith(
          status: SplashStatus.loaded,
        ),
      ),
    );
  }
}
