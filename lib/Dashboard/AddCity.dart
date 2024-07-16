import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../main.dart';

class AddCity extends StatefulWidget {
  @override
  _AddCityFormState createState() => _AddCityFormState();
}

class _AddCityFormState extends State<AddCity> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;
  List<dynamic> _countries = [];
  String? _selectedCountryId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse('${Url}/dropdowmcity.php'));
    if (response.statusCode == 200) {
      setState(() {
        _countries = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load countries');
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

      String cityName = _nameController.text;
      String countryId = _selectedCountryId!;
      String description = _descriptionController.text;

      // Prepare image file to be sent
      String fileName = _image!.path.split('/').last;
      var request = http.MultipartRequest('POST', Uri.parse('${Url}/addCity.php'));
      request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
      request.fields['name'] = cityName;
      request.fields['country_id'] = countryId;
      request.fields['description'] = description;

      var response = await request.send();

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('City added successfully')),
        );
        clearForm();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add city')),
        );
      }
    }
  }

  void clearForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _descriptionController.clear();
    setState(() {
      _image = null;
      _selectedCountryId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add City'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'City Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter City Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the city name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Country',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _selectedCountryId,
                hint: Text('Select Country'),
                items: _countries.map<DropdownMenuItem<String>>((country) {
                  return DropdownMenuItem<String>(
                    key: UniqueKey(),
                    value: country['id'].toString(),
                    child: Text(country['name']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCountryId = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a country';
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
