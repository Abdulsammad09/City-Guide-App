import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:citieguide/main.dart';
import 'package:flutter/material.dart';
import 'package:citieguide/App/HomeScreen.dart';
import 'package:citieguide/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Make sure to import necessary dependencies

class Sidebar extends StatefulWidget {
  final String userName; // User's name
  final String userEmail; // User's email

  // Constructor to initialize userName and userEmail
  Sidebar({required this.userName, required this.userEmail});

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String name = "John Doe";
  String email = "johndoe@example.com";
  bool isLoggedIn = false; // Track login state

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    if (userId != null) {
      var url = '${Url}/app/fetch_profile.php?user_id=$userId';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data["status"] == "Success") {
          setState(() {
            name = data['name'] ?? "John Doe";
            email = data['email'] ?? "johndoe@example.com";
            isLoggedIn = true; // User is logged in
          });
        } else {
          print('Error: ${data["message"]}');
        }
      } else {
        print('Failed to load profile data');
      }
    } else {
      print('User ID not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            if (isLoggedIn)
              UserAccountsDrawerHeader(
                accountName: Text(widget.userName.isEmpty ? name : widget.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text(widget.userEmail.isEmpty ? email : widget.userEmail),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(name.isEmpty ? '' : name[0].toUpperCase(), style: TextStyle(fontSize: 24.0, color: Colors.blue)),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            if (isLoggedIn)
              _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, _createRoute(AppHomeScreen()));
                },
              ),
            if (!isLoggedIn) // Show login button if not logged in
              Padding(
                padding: const EdgeInsets.symmetric(vertical:350,horizontal: 80 ),
                child: ListTile(

                  title: Text('Log In', style: TextStyle(color: Colors.blue)),
                  leading: Icon(Icons.login, color: Colors.blue),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ),
            if (isLoggedIn)
              Divider(),
            if (isLoggedIn)
              ListTile(
                title: Text('Log Out', style: TextStyle(color: Colors.red)),
                leading: Icon(Icons.exit_to_app, color: Colors.red),
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.remove('user_id');
                  setState(() {
                    isLoggedIn = false; // Update login state
                  });
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
