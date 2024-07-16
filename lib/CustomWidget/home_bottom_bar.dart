import 'package:citieguide/App/HomeScreen.dart';
import 'package:citieguide/App/ProfileScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 2,
      items: [
        Icon(Icons.person_outline, size: 30), // index 0
        Icon(Icons.favorite_outline, size: 30), // index 1
        Icon(Icons.home, size: 30, color: Colors.redAccent), // index 2
        // index 3 (updated)
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppHomeScreen()),
            );
            break;
          case 3:
          // Placeholder for a new screen
            break;
        }
      },
    );
  }
}

// Dummy page classes for navigation demonstration
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: Center(child: Text("Favorites Page")),
    );
  }
}
