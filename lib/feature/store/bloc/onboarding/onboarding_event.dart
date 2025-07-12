part of 'onboarding_bloc.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.started() = _Started;
  const factory OnboardingEvent.searchPlaceRequested({required String query}) = SearchPlaceRequested;
  const factory OnboardingEvent.selectPlaceRequested({required String placeId,
 required String description}) = SelectPlaceRequested;
}
