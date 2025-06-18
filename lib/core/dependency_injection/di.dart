import 'package:get/get.dart';
import 'package:waitwing/feature/auth/bloc/auth_bloc.dart';
import 'package:waitwing/feature/auth/data/auth_repo.dart';
import 'package:waitwing/feature/auth/domain/auth_repo_impl.dart';
import 'package:waitwing/feature/user/user_registration/bloc/user_registration_bloc.dart';


void setupDependencies() {
  Get.put<AuthRepo>(AuthRepoImpl());
  Get.put<AuthBloc>(AuthBloc(Get.find<AuthRepo>()));
  Get.put<UserRegistrationBloc>(UserRegistrationBloc(Get.find<AuthRepo>()));
}
