

import 'package:flutter/material.dart';


import '../CustomWidget/CustomWidget.dart';
import '../constant/constant.dart';
import 'AddCountry.dart';
import 'ViewCountry.dart';




class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

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
                  itemDashboard(context, "Add Country", Icons.add_outlined, Colors.deepOrange, AddCountry()),
                  itemDashboard(context, "View Country", Icons.add_outlined, Colors.deepOrange, ViewCountry()),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
