part of 'add_client_bloc.dart';

@freezed
abstract class AddClientState with _$AddClientState {
  const factory AddClientState({
    @Default(false) bool isLoading
})=_AddClientState;
}
