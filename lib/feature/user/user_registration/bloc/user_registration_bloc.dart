import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waitwing/core/failure/failures.dart';
import 'package:waitwing/feature/auth/domain/auth_repo.dart';
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

    on<Login>((event, emit) async {
      try {
        final eitherFailureOrUnit =
            await authRepo.signIn(email: event.email, password: event.password);

        eitherFailureOrUnit.fold((failure) {
          emit(state.copyWith(loginEitherFailureOrUnit: some(Left(failure))));
        }, (_) {
          emit(state.copyWith(loginEitherFailureOrUnit: some(Right(unit))));
        });
      } catch (e) {
        logE(e);
      }
    });

    on<SignUp>((event, emit) async {
      try {
        final eitherFailureOrUnit = await authRepo.signUp(
            email: event.email,
            password: event.password,
            username: event.username);
        eitherFailureOrUnit.fold((failure) {
          emit(state.copyWith(loginEitherFailureOrUnit: some(Left(failure))));
        }, (_) {
          emit(state.copyWith(loginEitherFailureOrUnit: some(Right(unit))));
        });
      } catch (e) {
        logE(e);
      }
    });
  }
}
