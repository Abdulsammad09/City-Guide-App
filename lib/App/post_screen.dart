import 'package:citieguide/App/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EventScreen.dart';
import 'HotelScreen.dart';
import 'RestaurantScreen.dart';

class PostScreen extends StatelessWidget {
  final int cityId;

  final String cityName;
  final String cityImagePath;
  final String cityDescription;

  const PostScreen({
    Key? key,
    required this.cityId,

    required this.cityName,
    required this.cityImagePath,
    required this.cityDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(cityImagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.all(15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xFFB8B8B8),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        cityName,
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: Color(0xFF232323),
                        ),
                      ),
                      Text(
                        "Show Map",
                        style: GoogleFonts.getFont(
                          "Roboto Condensed",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFF176FF2),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 5),
                    Text(
                      "4.5 (354 Reviews)",
                      style: GoogleFonts.getFont(
                        "Roboto Condensed",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF606060),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  cityDescription,
                  style: GoogleFonts.getFont(
                    "Roboto Condensed",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xFF606060),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 29),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Facilities",
                        style: GoogleFonts.getFont(
                          "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFF232323),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildCard(
                            assetPath: 'assets/vectors/vector_2_x2.svg',
                            text: "Hotel",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppHotelScreen(
                                    cityId: cityId ,
                                    imagePath: cityImagePath, // Pass the city image path
                                    countryName: cityName,    // Pass the city name or country name
                                  ),
                                ),
                              );
                            },
                          ),

                          _buildCard(
                            assetPath: 'assets/vectors/vector_1_x2.svg',
                            text: "Restaurant",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppRestaurantScreen(
                                    cityId: cityId ,

                                    imagePath: cityImagePath, // Pass the city image path
                                    countryName: cityName,    // Pass the city name or country name
                                  ),
                                ),
                              );
                            },
                          ),
                          _buildCard(
                            assetPath: 'assets/vectors/vector_x2.svg',
                            text: "Event",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppEventScreen(
                                    cityId: cityId ,

                                    imagePath: cityImagePath, // Pass the city image path
                                    countryName: cityName,    // Pass the city name or country name
                                  ),
                                ),
                              );
                            },
                          ),
                          _buildCard(
                            assetPath: 'assets/vectors/vector_3_x2.svg',
                            text: "Pool",
                            onTap: () {
                              print("Pool clicked");
                              // Add your onTap code here
                            },
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Price",
                        style: GoogleFonts.getFont(
                          "Roboto Condensed",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF232323),
                        ),
                      ),
                    ),
                    Text(
                      "\$199",
                      style: GoogleFonts.getFont(
                        "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xE2FF5252),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.8,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF176FF2),
                  ),
                  child: Center(child: Text(
                    "Book Now",
                    style: GoogleFonts.getFont("Roboto Condensed",
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 18,
                    ),),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      {required String assetPath, required String text, required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.fromLTRB(0, 14, 0, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0x0D176FF2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                width: 30,
                height: 28,
                child: SvgPicture.asset(assetPath),
              ),
              Padding(
                padding: EdgeInsets.only(right: 1.3),
                child: Text(
                  text,
                  style: GoogleFonts.getFont(
                    "Roboto Condensed",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black26,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}