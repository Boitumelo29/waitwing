import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
@envied
abstract class Env {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static  String apiURL = _Env.apiURL;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static  String apiKey = _Env.apiKey;

  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static  String supaBaseURL = _Env.supaBaseURL;

  @EnviedField(varName: 'SUPABASE_ANONKEY', obfuscate: true)
  static  String supaBaseAnonKey = _Env.supaBaseAnonKey;

  @EnviedField(varName: 'GOOGLEMAPS_KEY', obfuscate: true)
  static  String googleMapsKey = _Env.googleMapsKey;
}
