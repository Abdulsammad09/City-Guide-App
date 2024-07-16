import 'package:flutter/material.dart';



Widget itemDashboard(BuildContext context, String title, IconData iconData, Color background, Widget targetScreen) => GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetScreen),
    );
  },
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 5,
          blurRadius: 15,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: Colors.white, size: 30,),
        ),
        SizedBox(height: 10,),
        Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        )),
      ],
    ),
  ),
);
