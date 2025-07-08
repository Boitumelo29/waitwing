import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clients_event.dart';
part 'clients_state.dart';
part 'clients_bloc.freezed.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  ClientsBloc() : super(const ClientsState()) {
    on<ClientsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
