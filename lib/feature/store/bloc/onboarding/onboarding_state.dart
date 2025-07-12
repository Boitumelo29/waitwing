part of 'onboarding_bloc.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default([]) List<dynamic> predictions,
    @Default(false) bool isLoading,
    @Default("") String name,
    Map<String, dynamic>? details,
  }) = _OnboardingState;
}
