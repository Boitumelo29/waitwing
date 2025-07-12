import 'package:get/get.dart';
import 'package:waitwing/core/env/env.dart';
import 'package:waitwing/core/shared/data/image_repo.dart';
import 'package:waitwing/core/shared/domain/image_repo.dart';
import 'package:waitwing/feature/auth/bloc/auth_bloc.dart';
import 'package:waitwing/feature/auth/domain/auth_repo.dart';
import 'package:waitwing/feature/auth/data/auth_repo_impl.dart';
import 'package:waitwing/feature/store/bloc/onboarding/onboarding_bloc.dart';
import 'package:waitwing/feature/store/data/google_places_service.dart';
import 'package:waitwing/feature/store/domain/google_places_services.dart';
import 'package:waitwing/feature/user/user_profile/bloc/user_bloc.dart';
import 'package:waitwing/feature/user/user_registration/bloc/user_registration_bloc.dart';

void setupDependencies() {
  Get.put<AuthRepo>(AuthRepoImpl());
  Get.put<AuthBloc>(AuthBloc(Get.find<AuthRepo>()));
  Get.put<UserRegistrationBloc>(UserRegistrationBloc(Get.find<AuthRepo>()));
  Get.put<ImageRepository>(ImageRepositoryImp());
  Get.put<UserBloc>(
      UserBloc(Get.find<AuthRepo>(), Get.find<ImageRepository>()));
  Get.put<GooglePlacesService>(
      GooglePlacesServiceImp(apiKey: Env.googleMapsKey));
  Get.put<OnboardingBloc>(OnboardingBloc(Get.find<GooglePlacesService>()));
}
