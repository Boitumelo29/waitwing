import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waitwing/feature/store/data/google_places_service.dart';
import 'package:waitwing/utils/logger/logger.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

part 'onboarding_bloc.freezed.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GooglePlacesService service;
  DateTime? _lastSearchTime;

  OnboardingBloc(this.service) : super(OnboardingState()) {
    on<SearchPlaceRequested>((event, emit) async {
      final now = DateTime.now();
      if (_lastSearchTime != null &&
          now.difference(_lastSearchTime!) < Duration(milliseconds: 400)) {
        return;
      }
      _lastSearchTime = now;

      if (event.query.isEmpty) {
        return;
      }

      emit(state.copyWith(isLoading: true));
      try {
        final predictions = await service.searchPlaces(event.query);
        emit(state.copyWith(predictions: predictions, isLoading: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        logE(e);
      }
    });

    on<SelectPlaceRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final details = await service.getPlaceDetails(event.placeId);
        emit(state.copyWith(
            name: event.description, details: details, isLoading: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        logE(e);
      }
    });
  }
}
