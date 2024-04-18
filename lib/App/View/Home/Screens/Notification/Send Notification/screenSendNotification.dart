import 'package:app/App/Service/Api/Function/Notification/push.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../Service/Api/Bdd/local/auth.dart';
import '../../../../Welcome/inistateWelcome.dart';

class SendNotification extends StatefulWidget {
  final int id_user;

  const SendNotification({required this.id_user});

  @override
  _SendNotificationState createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _name;
  String? _ditails;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    try {
      await pushNotification(
              id: widget.id_user.toString(),
              title: userDataapp!.name.toString(),
              description: _ditails.toString(),
              post_id: userid.read('iduser'))
          .then((value) => Navigator.pop(context));
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
        title: Text('ارسال رسالة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              textfieldditails(),
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

  TextFormField textfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "عنوان الرسالة",
        border: OutlineInputBorder(
          // Add this line to add a border
          borderSide: BorderSide(
            color: Colors.blue, // Change border color
            width: 2.0, // Change border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          // Add this line to customize border when the TextFormField is focused
          borderSide: BorderSide(
            color: Colors.green, // Change focused border color
            width: 2.0, // Change focused border width
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
      onSaved: (value) {
        _name =
            value; // Make sure '_name' is declared and correctly managed in your state
      },
    );
  }

  TextFormField textfieldditails() {
    return TextFormField(
      minLines: 4, // Minimum number of lines in the TextFormField
      maxLines: null,
      decoration: InputDecoration(
        labelText: "مضمون الرسالة",
        border: OutlineInputBorder(
          // Add this line to add a border
          borderSide: BorderSide(
            color: Colors.blue, // Change border color
            width: 2.0, // Change border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          // Add this line to customize border when the TextFormField is focused
          borderSide: BorderSide(
            color: Colors.green, // Change focused border color
            width: 2.0, // Change focused border width
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a ditails';
        }
        return null;
      },
      onSaved: (value) {
        _ditails =
            value; // Make sure '_name' is declared and correctly managed in your state
      },
    );
  }
}
