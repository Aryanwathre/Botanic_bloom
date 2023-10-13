import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../model/plant_detail.dart';

class PlantDetailPage extends StatelessWidget {
  final String Common_Name;
  final int id;
  final Color green = const Color(0xff155245);

  const PlantDetailPage(
      {super.key, required this.id, required this.Common_Name});

  Future<Details> fetchPlantDetails() async {
    const apiKey = 'sk-6AJT651c54c4a3b1d2337';
    final apiUrl =
        Uri.parse('https://perenual.com/api/species/details/$id?key=$apiKey');

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Details details = detailsFromJson(json.encode(jsonResponse));

      // final Details detail = Details.fromJson(jsonResponse);
      if (kDebugMode) {
        print(jsonResponse);
      }
      return details;
    } else {
      throw Exception('Failed to load plant details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Common_Name),
      ),
      body: FutureBuilder<Details?>(
        future: fetchPlantDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('assets/loading.json'),
            );
          } else if (snapshot.hasError) {
            print(snapshot);
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text('No data found'),
            );
          } else {
            final Details plantDetails = snapshot.data!;
            final imageUrl = plantDetails.defaultImage.mediumUrl;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //image
                  Hero(
                    tag: 'plantImage_$id',
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, url) =>
                            Lottie.asset('assets/loading.json'),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/404.png",
                          height: 130,
                          scale: 2.7,
                        ),
                      ),
                    ),
                  ),
                  //Common Name
                  Text(
                    plantDetails.commonName,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                        child: buildIconText(
                          Icons.water_drop,
                          green,
                          plantDetails.watering,
                        ),
                      ),
                      Expanded(
                        child: buildIconText(
                          FontAwesomeIcons.ruler,
                          green,
                          plantDetails.dimension,
                        ),
                      ),
                      Expanded(
                        child: buildIconText(
                          Icons.sunny,
                          green,
                          plantDetails.sunlight.join(', '),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(plantDetails.description),
                  const SizedBox(height: 16.0),
                  Text(
                    'Scientific Names: ${plantDetails.scientificName.join(', ')}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Other Names: ${plantDetails.otherName.join(', ')}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Family: ${plantDetails.family ?? "No data"}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Origin: ${plantDetails.origin.join(', ')}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Type: ${plantDetails.type ?? "No data"}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Cycle: ${plantDetails.cycle ?? "No data"}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Propagation: ${plantDetails.propagation.join(', ')}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildIconText(IconData icon, Color color, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 30,
        ),
        Text(text),
      ],
    );
  }
}
