

abstract class GooglePlacesService{

  Future<List<dynamic>> searchPlaces(String input);

  Future<Map<String, dynamic>> getPlaceDetails(String placeId);
}