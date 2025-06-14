part of 'user_registration_bloc.dart';

@freezed
class UserRegistrationState with _$UserRegistrationState {
  factory UserRegistrationState({
    @Default(true) bool loginSelected,
    @Default(false) bool signUpSelected,
  }) = _UserRegistrationState;

  @override
  // TODO: implement loginSelected
  bool get loginSelected => throw UnimplementedError();

  @override
  // TODO: implement signUpSelected
  bool get signUpSelected => throw UnimplementedError();


}
