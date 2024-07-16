import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddCountry extends StatefulWidget {
  @override
  _AddCountryState createState() => _AddCountryState();
}

class _AddCountryState extends State<AddCountry> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();
  final TextEditingController newController = TextEditingController();

  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImage() async {
    final uri = Uri.parse("${Url}/addCountry.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = newController.text;
    var pic = await http.MultipartFile.fromPath("image", _image!.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Uploading image: ${_image!.path}');
      print('Entered text: ${newController.text}');
      // Show a snackbar with the message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image uploaded successfully'),
        ),
      );
      // Clear the text field and image
      setState(() {
        newController.clear();
        _image = null;
      });
    } else {
      print('Failed to upload image.');
      // Show a snackbar with the message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to upload image'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Country'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: newController,
                decoration: const InputDecoration(
                  hintText: 'Enter Country name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the country name';
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
                child: ElevatedButton(
                  onPressed: getImage,
                  child: Text("Choose Image"),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _image != null) {
                      uploadImage();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please complete the form and select an image.'),
                        ),
                      );
                    }
                  },
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
