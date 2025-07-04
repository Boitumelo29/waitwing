part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.loadUser() = LoadUser;
  const factory UserEvent.getUserImage({required String accountId, required ImageSource img }) = GetUserImage;
  const factory UserEvent.fetchUserImage() = FetchUserImage;
}
