import 'dart:convert';
import 'package:citieguide/App/SideBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:citieguide/App/home_app_bar.dart';
import 'package:citieguide/CustomWidget/home_bottom_bar.dart';
import 'package:citieguide/main.dart';
import 'CityScreen.dart'; // Add this import

class AppHomeScreen extends StatefulWidget {
  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  List<dynamic> countries = [];
  List<dynamic> filteredCountries = [];
  Set<int> favoriteCountries = Set<int>(); // Add this line
  TextEditingController searchController = TextEditingController();
  bool isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse('${Url}/app/fetch_country.php'));

    if (response.statusCode == 200) {
      setState(() {
        countries = json.decode(response.body);
        filteredCountries = countries;
      });
    } else {
      throw Exception('Failed to load countries');
    }
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where((country) => country['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void toggleSearchVisibility() {
    setState(() {
      isSearchVisible = !isSearchVisible;
    });
  }

  void toggleFavorite(int countryId) {
    setState(() {
      if (favoriteCountries.contains(countryId)) {
        favoriteCountries.remove(countryId);
      } else {
        favoriteCountries.add(countryId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isSearchVisible ? 140.0 : 90.0), // Adjust height based on search visibility
        child: Column(
          children: [
            HomeAppBar(onSearchTap: toggleSearchVisibility),
            if (isSearchVisible)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: filterCountries,
                  decoration: InputDecoration(
                    hintText: 'Search countries...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      drawer: Sidebar(userName: '', userEmail: '',),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: filteredCountries.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            int countryId = int.parse(filteredCountries[index]['id'].toString());
                            bool isFavorite = favoriteCountries.contains(countryId);

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AppCityScreen(
                                      countryId: countryId,
                                      countryName: filteredCountries[index]['name'],
                                      imagePath: "${Url}/upload/${filteredCountries[index]['image_path']}",
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 160,
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${Url}/upload/${filteredCountries[index]['image_path']}"),
                                    fit: BoxFit.cover,
                                    opacity: 0.9,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        icon: Icon(
                                          isFavorite ? Icons.bookmark : Icons.bookmark_border_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          toggleFavorite(countryId);
                                        },
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        filteredCountries[index]['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),

                          child:  Text(
                            "Explore Country",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredCountries.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    int countryId = int.parse(filteredCountries[index]['id'].toString());
                    bool isFavorite = favoriteCountries.contains(countryId);

                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppCityScreen(
                                    countryId: countryId,
                                    countryName: filteredCountries[index]['name'],
                                    imagePath: "${Url}/upload/${filteredCountries[index]['image_path']}",
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${Url}/upload/${filteredCountries[index]['image_path']}"),
                                  fit: BoxFit.cover,
                                  opacity: 1,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: Icon(
                                    isFavorite ? Icons.bookmark : Icons.bookmark_border_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    toggleFavorite(countryId);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  filteredCountries[index]['name'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.more_vert,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
