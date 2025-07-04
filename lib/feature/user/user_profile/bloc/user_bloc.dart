import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waitwing/core/shared/image_repo.dart';
import 'package:waitwing/feature/auth/domain/auth_repo.dart';
import 'package:waitwing/utils/logger/logger.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepo authRepo;
  final ImageRepository imageRepository;

  UserBloc(this.authRepo, this.imageRepository) : super(UserState()) {
    on<UserEvent>((event, emit) {});

    on<LoadUser>((event, emit) {
      try {
        final user = authRepo.currentUser;
        emit(state.copyWith(currentUser: user));
      } catch (e) {
        logE(e);
        emit(state.copyWith(currentUser: null));
      }
    });

    on<GetUserImage>((event, emit) {
      try {
        imageRepository.getUserImage(event.img, event.accountId);
      } catch (e) {
        print("we have an error");
      }
    });
    on<FetchUserImage>((event, emit) async {
      try {
        final user = authRepo.currentUser;

        if (user != null) {
          final imageEither = await imageRepository.fetchUserImage(user.id);

          imageEither.fold(
            (failure) => logE("Failed to fetch image: $failure"),
            (imageBytes) {
              final base64String = base64Encode(imageBytes);
              emit(state.copyWith(userImage: base64String));
            },
          );
        }
      } catch (e) {
        logE("we have an error: $e");
      }
    });
  }
}
