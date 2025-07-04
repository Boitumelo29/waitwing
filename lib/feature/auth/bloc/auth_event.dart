part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;
  const factory AuthEvent.listenToAuthChanges() = ListenToAuthChanges;
  const factory AuthEvent.signOut() = SignOut;
}
