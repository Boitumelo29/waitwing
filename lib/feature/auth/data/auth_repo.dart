import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waitwing/core/failure/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> signUp(
      {required String email,
      required String password,
      required String username});

  Future<Either<Failure, AuthResponse>> signIn(
      {required String email, required String password});

  Future<Either<Failure, Unit>> signOut();

  User? get currentUser;

  Session? get currentSession;

  Stream<AuthState> get authStateChange;
}
