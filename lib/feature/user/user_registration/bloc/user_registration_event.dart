part of 'user_registration_bloc.dart';

enum RegistrationType{login, sign}

@freezed
class UserRegistrationEvent with _$UserRegistrationEvent {
  const factory UserRegistrationEvent.started() = _Started;
  const factory UserRegistrationEvent.registrationSelected({ required RegistrationType registrationType}) =
      RegistrationSelected;
}
