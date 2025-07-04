part of 'user_bloc.dart';

@freezed
abstract class UserState with _$UserState {
   factory UserState({
    User? currentUser,
     @Default("") String userImage,
  }) = _UserState;

  UserState._();

   String get username =>
       currentUser?.userMetadata?['displayName'] as String? ?? 'Guest';

}
