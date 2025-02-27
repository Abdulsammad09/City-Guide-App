import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../main.dart';

class AddRestaurant extends StatefulWidget {
  @override
  _AddRestaurantState createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  File? _image;
  List<dynamic> _cities = [];
  String? _selectedCityId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  Future<void> fetchCities() async {
    final response = await http.get(Uri.parse('${Url}/dropdownhotal.php'));
    if (response.statusCode == 200) {
      setState(() {
        _cities = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load cities');
    }
  }

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadImage() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String name = _nameController.text;
      String cityId = _selectedCityId!;
      String description = _descriptionController.text;
      String address = _addressController.text;

      String fileName = _image!.path.split('/').last;
      var request = http.MultipartRequest('POST', Uri.parse('${Url}/addRestaurant.php'));
      request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
      request.fields['name'] = name;
      request.fields['city_id'] = cityId;
      request.fields['description'] = description;
      request.fields['address'] = address;

      var response = await request.send();

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Restaurant added successfully')),
        );
        clearForm();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add restaurant')),
        );
      }
    }
  }

  void clearForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _descriptionController.clear();
    _addressController.clear();
    setState(() {
      _image = null;
      _selectedCityId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Restaurant'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Restaurant Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Restaurant Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the restaurant name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'City',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _selectedCityId,
                hint: Text('Select City'),
                items: _cities.map<DropdownMenuItem<String>>((city) {
                  return DropdownMenuItem<String>(
                    key: UniqueKey(),
                    value: city['id'].toString(),
                    child: Text(city['name']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCityId = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter Description',
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  hintText: 'Enter Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(_image!),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: getImage,
                  icon: Icon(Icons.image),
                  label: Text("Choose Image"),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: uploadImage,
                  child: Text('Upload'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
