// ignore: file_names

import 'package:citieguide/model/country.dart';
import '../CustomWidget/CustomWidget.dart';
import '../constant/constant.dart';
import 'AddHotel.dart';
import 'AddRestaurant.dart';
import 'Cityscreen.dart';
import 'Countryscreen.dart';
import 'package:flutter/material.dart';


import 'EventScreen.dart';
import 'HotalScreen.dart';
import 'RestaurantScreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Appbar(),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  itemDashboard(context, "Country", Icons.public, Colors.deepOrange, CountryScreen()),
                  itemDashboard(context, "City", Icons.location_city, Colors.green, dashboardCityScreen()),
                  itemDashboard(context, "Hotel", Icons.hotel, Colors.blue, HotelScreen()),
                  itemDashboard(context, "Resturant", Icons.restaurant, Colors.blue, Restaurantscreen()),
                  itemDashboard(context, "Event", Icons.event, Colors.blue, EventScreen()),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
