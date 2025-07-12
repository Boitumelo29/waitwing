import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:waitwing/feature/store/bloc/onboarding/onboarding_bloc.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Column(
            children: [
              Text('Add Address'),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search address',
                    contentPadding: const EdgeInsets.all(12),
                    border: InputBorder.none,
                  ),
                  onChanged: (query) => context.read<OnboardingBloc>().add(
                        SearchPlaceRequested(query: query),
                      ),
                ),
              ),
              const SizedBox(height: 10),
              if (state.isLoading) const CircularProgressIndicator(),
              Container(
                constraints: const BoxConstraints(maxHeight: 200),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.predictions.length,
                  itemBuilder: (context, index) {
                    final prediction = state.predictions[index];
                    return ListTile(
                      title: Text(prediction['description']),
                      onTap: () => context.read<OnboardingBloc>().add(
                            SelectPlaceRequested(
                                placeId: prediction['place_id'],
                                description: prediction['description']),
                          ),
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selected Location:',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(state.name),
                  Text('Lat: ${state.details?['geometry']['location']['lat']}'),
                  Text('Lng: ${state.details?['geometry']['location']['lng']}'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

// class SearchContent extends StatefulWidget {
//   const SearchContent({super.key});
//
//   @override
//   State<SearchContent> createState() =>
//       _SearchContentState();
// }
//
// class _SearchContentState
//     extends State<SearchContent> {
//   final TextEditingController _searchController = TextEditingController();
//   List<dynamic> _placePredictions = [];
//   String apiKey = "AIzaSyDmcp120kJ2G-2G4A-EATb2WaQ1WdbPPCs";
//   bool _isLoading = false;
//   String? _errorMessage;
//   DateTime? _lastSearchTime;
//
//   String? _selectedPlaceName;
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   void _searchPlaces(String input) async {
//     final now = DateTime.now();
//     if (_lastSearchTime != null &&
//         now.difference(_lastSearchTime!) < Duration(milliseconds: 400)) {
//       return;
//     }
//     _lastSearchTime = now;
//
//     if (input.isEmpty) {
//       setState(() {
//         _placePredictions = [];
//         _errorMessage = null;
//       });
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });
//
//     final String baseUrl =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json';
//     final request = '$baseUrl?input=$input&key=$apiKey&components=country:za';
//
//     try {
//       final response = await http.get(Uri.parse(request));
//       final data = json.decode(response.body);
//
//       if (response.statusCode == 200 && data['status'] == 'OK') {
//         setState(() {
//           _placePredictions = data['predictions'];
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _placePredictions = [];
//           _isLoading = false;
//           _errorMessage = data['error_message'] ?? 'No results found.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _placePredictions = [];
//         _isLoading = false;
//         _errorMessage = 'Failed to fetch places.';
//       });
//     }
//   }
//
//   void _selectPrediction(String placeId, String description) async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });
//
//     final detailsUrl =
//         'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';
//
//     try {
//       final response = await http.get(Uri.parse(detailsUrl));
//       final data = json.decode(response.body);
//
//       if (data['status'] == 'OK') {
//         setState(() {
//           _selectedPlaceName = description;
//           _placePredictions.clear();
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
//           _errorMessage =
//               data['error_message'] ?? 'Failed to get place details.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _errorMessage = 'Failed to fetch place details.';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Text(context.loc.addAddress),
//           Material(
//             elevation: 4,
//             borderRadius: BorderRadius.circular(8),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: context.loc.searchAddress,
//                 contentPadding: const EdgeInsets.all(12),
//                 border: InputBorder.none,
//               ),
//               onChanged: _searchPlaces,
//             ),
//           ),
//           const SizedBox(height: 10),
//           if (_isLoading)
//             const CircularProgressIndicator()
//           else if (_errorMessage != null)
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.red[100],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(_errorMessage!,
//                   style: TextStyle(color: Colors.red[800])),
//             )
//           else if (_placePredictions.isNotEmpty)
//               Container(
//                 constraints: const BoxConstraints(maxHeight: 200),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: _placePredictions.length,
//                   itemBuilder: (context, index) {
//                     final prediction = _placePredictions[index];
//                     return ListTile(
//                       title: Text(prediction['description']),
//                       onTap: () => _selectPrediction(
//                         prediction['place_id'],
//                         prediction['description'],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//           const SizedBox(height: 20),
//           if (_selectedPlaceName != null)
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Selected Location:',
//                     style:
//                     TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 4),
//                 Text(_selectedPlaceName ?? ''),
//               ],
//             )
//         ],
//       ),
//     );
//   }
// }
