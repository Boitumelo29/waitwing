import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waitwing/core/failure/failures.dart';
import 'package:waitwing/utils/logger/logger.dart';

class ImageRepository {
  Future<Either<Failure, Unit>> getUserImage(
      ImageSource img, String accountId) async {
    try {
      logI("I am here");
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: img);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        final base64Image = base64Encode(bytes);

        final prefs = await SharedPreferences.getInstance();
        final ourImage =
            await prefs.setString('profile_image_$accountId', base64Image);
        logI(ourImage);
      }
      return right(unit);
    } catch (e) {
      return left(Failure(message: "Failed to get user image: $e"));
    }
  }

  Future<Either<Failure, Uint8List>> fetchUserImage(String accountId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userImage = prefs.getString(('profile_image_$accountId'));

      if (userImage != null) {
        final imageBytes = base64Decode(userImage);
        return right(imageBytes);
      } else {
        return left(const Failure(message: "Failed to get user image"));
      }
    } catch (e) {
      return left(Failure(message: "Failed to get user image: $e"));
    }
  }
}
