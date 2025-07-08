part of 'clients_bloc.dart';

@freezed
class ClientsEvent with _$ClientsEvent {
  const factory ClientsEvent.started() = _Started;
  const factory ClientsEvent.loadUsers() =  LoadUsers;
}
