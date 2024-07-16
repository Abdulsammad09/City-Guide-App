import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';



class ViewCountry extends StatefulWidget {
  const ViewCountry({super.key});

  @override
  State<ViewCountry> createState() => _ViewCountryState();
}

class _ViewCountryState extends State<ViewCountry> {
  List countries = [];

  Future<void> getRecords() async {
    final uri = Uri.parse("${Url}/viewCountry.php");

    try {
      var response = await http.get(uri);
      setState(() {
        countries = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteRecord(String id, BuildContext context) async {
    try {
      final uri = Uri.parse("${Url}/deleteCountry.php");

      var res = await http.post(uri, body: {'id': id});
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        setState(() {
          countries.removeWhere((country) => country['id'] == id);
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
        title: const Text('View Countries'),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          String imagePath = countries[index]["image_path"];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: isValidUrl(imagePath)
                  ? NetworkImage(imagePath)
                  : AssetImage('assets/images/person.jpg') as ImageProvider,
            ),
            title: Text(countries[index]["name"]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditCountry(country: countries[index]),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await deleteRecord(countries[index]['id'], context);
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

class EditCountry extends StatelessWidget {
  final Map country;

  const EditCountry({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${country["name"]}'),
      ),
      body: Center(
        child: Text('Edit details for ${country["name"]}'),
      ),
    );
  }
}
