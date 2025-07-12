import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
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
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(context.loc.addAddress),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: context.loc.searchAddress,
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
                    Text(
                        'Lat: ${state.details?['geometry']['location']['lat']}'),
                    Text(
                        'Lng: ${state.details?['geometry']['location']['lng']}'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}