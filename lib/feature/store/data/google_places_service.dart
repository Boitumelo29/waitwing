import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waitwing/feature/store/domain/google_places_services.dart';

class GooglePlacesServiceImp implements GooglePlacesService {
  final String apiKey;

  GooglePlacesServiceImp({required this.apiKey});

  @override
  Future<List<dynamic>> searchPlaces(String input) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&components=country:za';
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);
    if (response.statusCode == 200 && data['status'] == 'OK') {
      return data['predictions'];
    } else {
      throw Exception(data['error_message'] ?? 'No results found.');
    }
  }

  @override
  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);
    if (data['status'] == 'OK') {
      return data['result'];
    } else {
      throw Exception(data['error_message'] ?? 'Failed to get place details.');
    }
  }
}
