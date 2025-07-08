part of 'clients_bloc.dart';

@freezed
abstract class ClientsState with _$ClientsState {
  const factory ClientsState({
    @Default([]) List clients
})=_ClientsState;
}
