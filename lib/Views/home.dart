import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

import '../model/plant_list.dart';
import 'Plant_Detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Datum> data = [];
  int currentPage = 1;
  int lastPage = 1;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchData(currentPage);

    // Add a listener to the scroll controller to detect when the user reaches the end
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // User has reached the end of the list, load more data
        if (!isLoading && currentPage < lastPage) {
          fetchData(currentPage + 1);
        }
      }
    });
  }

  Future<void> fetchData(int page) async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    const apiKey = 'sk-6AJT651c54c4a3b1d2337';
    final apiUrl = Uri.parse(
        'https://perenual.com/api/species-list?key=$apiKey&page=$page');

    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final Welcome welcome = welcomeFromJson(json.encode(jsonResponse));
        print(welcome);
        setState(() {
          data.addAll(welcome.data);
          currentPage = welcome.currentPage;
          lastPage = welcome.lastPage;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemCount: data.length + 1, // +1 for the loading indicator
        itemBuilder: (context, index) {
          if (index < data.length) {
            final item = data[index];
            return (item.defaultImage != null)
                ? Padding(
                    padding: const EdgeInsets.all(1.25),
                    child: GestureDetector(
                      onTap: () {
                        print(item.commonName);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlantDetailPage(
                              id: item.id,
                              Common_Name: item.commonName,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag:
                            'plantImage_${item.id}', // Unique tag for each item
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: item.defaultImage!.mediumUrl,
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
                    ),
                  )
                : Image.asset(
                    "assets/404.png",
                    height: 130,
                    scale: 2.7,
                  );
          } else {
            // No more pages to load
            return Center(
              child:
                  Lottie.asset('assets/loading.json'), // or any other indicator
            );
          }
        },
      ),
    );
  }
}
