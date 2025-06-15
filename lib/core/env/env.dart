import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
@envied
abstract class Env {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static const String apiURL = _Env.apiURL;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static const String apiKey = _Env.apiKey;
}
