import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waitwing/feature/auth/data/auth_repo.dart';
import 'package:waitwing/utils/logger/logger.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(const AuthState()) {
    on<AuthEvent>((event, emit) {});
    on<CheckAuthStatus>((event, emit) {
      emit(state.copyWith(status: AuthStatus.loading));

      try {
        final currentUser = authRepo.currentUser;
        final session = authRepo.currentSession;
        logI("This is our user: $currentUser");

        if (currentUser != null && session != null) {
          emit(state.copyWith(
              status: AuthStatus.authenticated, user: currentUser));
        } else {
          logE("User is null.");
          emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
        }
      } catch (e) {
        logE(e);
        emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
      }
    });
  }
}
