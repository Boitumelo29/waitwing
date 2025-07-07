import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {});

    on<SetCalenderStatus>((event, emit) {
      if (event.status == CalendarViewStatus.day) {
        emit(state.copyWith(calendarStatus: CalendarViewStatus.day));
      } else if (event.status == CalendarViewStatus.week) {
        emit(state.copyWith(calendarStatus: CalendarViewStatus.week));
      } else {
        emit(state.copyWith(calendarStatus: CalendarViewStatus.month));
      }
    });
  }
}
