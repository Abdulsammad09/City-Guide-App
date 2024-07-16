
import 'package:citieguide/Dashboard/AddHotel.dart';
import 'package:citieguide/Dashboard/AddRestaurant.dart';
import 'package:citieguide/Dashboard/ViewCity.dart';
import 'package:flutter/material.dart';
import '../CustomWidget/CustomWidget.dart';
import '../constant/constant.dart';
import 'AddCity.dart';
import 'ViewHotel.dart';
import 'ViewRestaurant.dart';


class Restaurantscreen extends StatelessWidget {
  const Restaurantscreen({super.key});

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
                  itemDashboard(context, "Add Restaurant", Icons.add_outlined, Colors.deepOrange, AddRestaurant()),
                  itemDashboard(context, "View Rastaurant", Icons.add_outlined, Colors.deepOrange, ViewRestauranturant()),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
