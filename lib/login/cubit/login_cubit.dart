import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthonticationRepository authonticationRepository,
  })  : _authonticationRepository = authonticationRepository,
        super(const LoginState());

  void emailChanged(String? value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [
            email,
            state.password,
          ],
        ),
      ),
    );
  }

  void passwordChanged(String? value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
          [
            state.email,
            password,
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      await _authonticationRepository.loginWithEmailAndPasswordFailure(
        email: state.email.value!,
        password: state.password.value!,
      );
    } on SignInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: e.message,
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

  final AuthonticationRepository _authonticationRepository;
}
