part of 'add_client_bloc.dart';

@freezed
class AddClientEvent with _$AddClientEvent {
  const factory AddClientEvent.started() = _Started;

  const factory AddClientEvent.addClient(
      {required String fullName,
      required String email,
      required String phoneNumber,
      required String notes}) = AddClient;
}
