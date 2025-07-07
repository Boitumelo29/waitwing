part of 'home_bloc.dart';

enum CalendarViewStatus { initial, day, week, month }

@freezed
abstract class HomeState with _$HomeState {
   factory HomeState(
      {@Default(CalendarViewStatus.day) CalendarViewStatus calendarStatus}) = _HomeState;
}
