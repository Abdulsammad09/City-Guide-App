import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';



class ViewRestauranturant extends StatefulWidget {
  const ViewRestauranturant({super.key});

  @override
  State<ViewRestauranturant> createState() => _ViewCityState();
}

class _ViewCityState extends State<ViewRestauranturant> {
  List restaurant = [];

  Future<void> getRecords() async {
    final uri = Uri.parse("${Url}/viewRestaurant.php");

    try {
      var response = await http.get(uri);
      setState(() {
        restaurant = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteRecord(String id, BuildContext context) async {
    try {
      final uri = Uri.parse("${Url}/deleteResturant.php");

      var res = await http.post(uri, body: {'id': id});
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        setState(() {
          restaurant.removeWhere((country) => country['id'] == id);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Record deleted"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to delete the record."),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred."),
        ),
      );
    }
  }

  @override
  void initState() {
    getRecords();
    super.initState();
  }

  bool isValidUrl(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Resturant'),
      ),
      body: ListView.builder(
        itemCount: restaurant.length,
        itemBuilder: (context, index) {
          String imagePath = restaurant[index]["image_path"];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: isValidUrl(imagePath)
                  ? NetworkImage(imagePath)
                  : AssetImage('assets/images/person.jpg') as ImageProvider,
            ),
            title: Text(restaurant[index]["name"]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditCity(city: restaurant[index]),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await deleteRecord(restaurant[index]['id'], context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EditCity extends StatelessWidget {
  final Map city;

  const EditCity({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${city["name"]}'),
      ),
      body: Center(
        child: Text('Edit details for ${city["name"]}'),
      ),
    );
  }
}
