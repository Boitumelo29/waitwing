import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_client_event.dart';

part 'add_client_state.dart';

part 'add_client_bloc.freezed.dart';

class AddClientBloc extends Bloc<AddClientEvent, AddClientState> {
  AddClientBloc() : super(const AddClientState()) {
    on<AddClientEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
