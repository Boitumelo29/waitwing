import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration_event.dart';
part 'user_registration_state.dart';
part 'user_registration_bloc.freezed.dart';

class UserRegistrationBloc
    extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  UserRegistrationBloc() : super(UserRegistrationState()) {
    on<RegistrationSelected>((event, emit) {
      final isLogin = event.registrationType == RegistrationType.login;

      emit(state.copyWith(
        loginSelected: isLogin,
        signUpSelected: !isLogin,
      ));
    });
  }
}
