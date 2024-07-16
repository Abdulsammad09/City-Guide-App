import 'package:citieguide/auth/login.dart';
import 'package:flutter/material.dart';
// Make sure to import your LoginPage

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/person.jpg'),
                    ),
                    const SizedBox(height: 20),
                    Text("Sammad", style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                    Text("Good Morning", style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildProfileItem(context, Icons.email, "Email", "sammad@example.com"),
              buildProfileItem(context, Icons.phone, "Phone", "+1234567890"),
              buildProfileItem(context, Icons.location_city, "Location", "City, Country"),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text("Save Changes", style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text("Logout", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileItem(BuildContext context, IconData icon, String label, String value) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(label),
          subtitle: Text(value),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle edit action
            },
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
