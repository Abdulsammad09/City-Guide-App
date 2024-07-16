
import 'package:citieguide/Dashboard/AddHotel.dart';
import 'package:citieguide/Dashboard/ViewCity.dart';
import 'package:flutter/material.dart';
import '../CustomWidget/CustomWidget.dart';
import '../constant/constant.dart';
import 'AddCity.dart';
import 'ViewHotel.dart';


class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

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
                  itemDashboard(context, "Add Hotel", Icons.add_outlined, Colors.deepOrange, AddHotel()),
                  itemDashboard(context, "View Hotel", Icons.add_outlined, Colors.deepOrange, ViewHotel()),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
