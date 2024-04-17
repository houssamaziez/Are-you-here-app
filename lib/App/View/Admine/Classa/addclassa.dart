import 'package:app/App/util/Const/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddClassaScreen extends StatefulWidget {
  final int id_lavel;

  AddClassaScreen({required this.id_lavel});

  @override
  _AddClassaScreenState createState() => _AddClassaScreenState();
}

class _AddClassaScreenState extends State<AddClassaScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _name;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(
            '${UrlApp.host}classa/store/id_lavel/${widget.id_lavel}'), // Put your API URL here
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': _name,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context, true);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle exception by showing an alert or a Snackbar
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافة قسم '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'اسم القسم'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child:
                    _isLoading ? CircularProgressIndicator() : Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
