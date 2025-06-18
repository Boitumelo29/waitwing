import 'package:freezed_annotation/freezed_annotation.dart';


part 'failures.freezed.dart';

@freezed
class Failure with _$Failure{
  const factory Failure({required String message})= _Failure;

  @override
  // TODO: implement message
  String get message => throw UnimplementedError();
}