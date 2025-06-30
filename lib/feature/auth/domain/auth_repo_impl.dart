import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waitwing/core/failure/failures.dart';
import 'package:waitwing/feature/auth/data/auth_repo.dart';
import 'package:waitwing/utils/logger/logger.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseClient client = Supabase.instance.client;

  //signup user
  @override
  Future<Either<Failure, AuthResponse>> signUp(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final response = await client.auth.signUp(
          email: email, password: password, data: {"displayName": username});

      if (response.user == null) {
        logE("User: ${response.toString()}");
        return left(Failure(message: "Sign up failed. Please try again."));
      } else {
        return right(response);
      }
    } on AuthException catch (e) {
      logE("Auth error: ${e.message}");
      return left(Failure(message: e.message));
    } catch (e) {
      logE("We have failed ${e.toString()}");
      return left(
          Failure(message: "An unexpected error occurred. Please try again."));
    }
  }

  //sign in user
  @override
  Future<Either<Failure, AuthResponse>> signIn(
      {required String email, required String password}) async {
    try {
      final response = await client.auth
          .signInWithPassword(password: password, email: email);

      if (response.user == null || response.session == null) {
        throw AuthException(response.toString());
      }

      return right(response);
    } catch (e) {
      logE(e);
      return left(Failure(message: "Sign In Fail: ${e.toString()}"));
    }
  }

  //signOut
  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await client.auth.signOut();
      return right(unit);
    } catch (e) {
      logE(e);
      return left(Failure(message: "Unable to signOut: ${e.toString()}"));
    }
  }

  //getCurrentUser
  @override
  User? get currentUser => client.auth.currentUser;

  //getCurrentSession
  @override
  Session? get currentSession => client.auth.currentSession;

  @override
  Stream<AuthState> get authStateChange => client.auth.onAuthStateChange;

  @override
  Future<bool> isUserLoggedIn()async {
    final session = client.auth.currentSession;
    return session != null;
  }

}
