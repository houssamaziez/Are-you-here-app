import 'package:app/App/Model/classa.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Model/Parent.dart';
import '../Parents/screenParents.dart';

class CreateStudentScreen extends StatefulWidget {
  final int userId;
  final int lavelId;
  final int classaId;
  final Classa classa;

  CreateStudentScreen(
      {required this.userId,
      required this.lavelId,
      required this.classaId,
      required this.classa});

  @override
  _CreateStudentScreenState createState() => _CreateStudentScreenState();
}

class _CreateStudentScreenState extends State<CreateStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _name;
  bool? _isPresent;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    print(selectedParent!.id.toString());
    print(widget.lavelId.toString());
    print(widget.lavelId.toString());
    print(widget.classaId.toString());
    print(_name!);
    print(selectedParent!.id.toString());
    print(selectedParent!.id.toString());
    var uri = Uri.parse(
        '${UrlApp.host}student/create/id_user=1/lavel_id=${widget.lavelId}/classa_id=${widget.classaId}'); // Set your API URL here
    var request = http.MultipartRequest('POST', uri)
      ..fields['user_id'] = selectedParent!.id.toString()
      ..fields['lavel_id'] = widget.lavelId.toString()
      ..fields['classa_id'] = widget.classaId.toString()
      ..fields['name'] = _name!
      ..fields['class'] = widget.classa.name!
      ..fields['isPresent'] = 'false';

    if (_image != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image', _image!.path));
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
      } else {
        throw Exception('Failed to create student');
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  Parent? selectedParent;
  List<Parent> parents = [];

  @override
  void initState() {
    super.initState();
    fetchParents();
  }

  fetchParents() async {
    // Simulate fetching data
    List<Parent> fetchedParents = await fetchUsers();
    setState(() {
      parents = fetchedParents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافة تلميذ'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              SizeApp.sizedboxh25,
              Card(
                color: Colors.blue,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 242, 254),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<Parent>(
                      value: selectedParent,
                      isExpanded: true,
                      onChanged: (Parent? newValue) {
                        setState(() {
                          selectedParent = newValue;
                        });
                      },
                      items: parents
                          .map<DropdownMenuItem<Parent>>((Parent parent) {
                        return DropdownMenuItem<Parent>(
                          value: parent,
                          child: Column(
                            children: [
                              Center(
                                  child: Row(
                                children: [
                                  Text(parent.name.toString()),
                                  Spacer(),
                                  Text(
                                    parent.address.toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Select Parent',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _image != null
                  ? Image.file(_image!)
                  : TextButton(
                      onPressed: _pickImage,
                      child: const Column(
                        children: [
                          Card(
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Icon(
                                Icons.image_outlined,
                                size: 100,
                              ),
                            ),
                          ),
                          Text('Select Image'),
                        ],
                      ),
                    ),
              ElevatedButton(
                onPressed:
                    _isLoading && selectedParent == null ? null : _submitForm,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
