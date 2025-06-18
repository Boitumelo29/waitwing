import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waitwing/feature/auth/data/auth_repo.dart';
import 'package:waitwing/utils/logger/logger.dart';

part 'user_registration_event.dart';

part 'user_registration_state.dart';

part 'user_registration_bloc.freezed.dart';

class UserRegistrationBloc
    extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  final AuthRepo authRepo;

  UserRegistrationBloc(this.authRepo) : super(UserRegistrationState()) {
    on<RegistrationSelected>((event, emit) {
      final isLogin = event.registrationType == RegistrationType.login;

      emit(state.copyWith(
        loginSelected: isLogin,
        signUpSelected: !isLogin,
      ));
    });

    on<Login>((event, emit) {
      try {
        authRepo.signIn(email: event.email, password: event.password);
      } catch (e) {
        logE(e);
      }
    });

    on<SignUp>((event, emit) {
      try {
        authRepo.signUp(
            email: event.email,
            password: event.password,
            username: event.username);
      } catch (e) {
        logE(e);
      }
    });
  }
}
