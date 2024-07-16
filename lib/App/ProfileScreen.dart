import 'dart:convert';
import 'package:citieguide/auth/login.dart';
import 'package:citieguide/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "John Doe";
  String email = "johndoe@example.com";
  String phone = "123-456-7890";
  String address = "123 Main Street, Springfield";
  String bio =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur.";

  bool isLoggedIn = false; // Track login state

  @override
  void initState() {
    super.initState();
    checkLoginStatus(); // Check initial login status
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    setState(() {
      isLoggedIn = userId != null;
    });
    if (isLoggedIn) {
      fetchProfileData(); // Fetch profile data if logged in
    }
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
            phone = data['phone'] ?? "123-456-7890";
            address = data['address'] ?? "123 Main Street, Springfield";
            bio =
                data['bio'] ??
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur.";
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

  Future<void> handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: isLoggedIn
            ? [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle edit button press
              print('Edit button pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: handleLogout,
          ),
        ]
            : [], // Show actions only if logged in
      ),
      body: isLoggedIn
          ? SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/person.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileDetailRow(
                      icon: Icons.person,
                      label: 'Name',
                      value: name,
                    ),
                    Divider(),
                    ProfileDetailRow(
                      icon: Icons.email,
                      label: 'Email',
                      value: email,
                    ),
                    Divider(),
                    ProfileDetailRow(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: phone,
                    ),
                    Divider(),
                    ProfileDetailRow(
                      icon: Icons.home,
                      label: 'Address',
                      value: address,
                    ),
                    Divider(),
                    ProfileDetailRow(
                      icon: Icons.info,
                      label: 'Bio',
                      value: bio,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Handle edit button press
                print('Edit Profile button pressed');
              },
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: handleLogout,
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.red,
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      )
          : Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileDetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueGrey, size: 24),
        SizedBox(width: 10),
        Text(
          '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
