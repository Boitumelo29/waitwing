 import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waitwing/core/failure/failures.dart';
 import 'dart:typed_data';

abstract class ImageRepository{

   Future<Either<Failure, Unit>> getUserImage(
       ImageSource img, String accountId);

   Future<Either<Failure, Uint8List>> fetchUserImage(String accountId);
 }