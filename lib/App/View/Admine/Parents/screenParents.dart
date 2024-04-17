import 'package:app/App/Model/Parent.dart';
import 'package:app/App/Service/ImageCach/imagecach.dart';
import 'package:app/App/Service/call/functioncall.dart';
import 'package:app/App/View/Admine/Parents/addparent.dart';
import 'package:app/App/View/Admine/Parents/profile.dart';
import 'package:app/App/View/Home/home.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Widgets/dialogs.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<List<Parent>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
    print('object');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (true) {
        setState(() {
          print('object');
        });
      }
    });
  }

  Future<void> refreshList() async {
    // Simulate a network request delay
    await Future.delayed(Duration(milliseconds: 500));

    // Update the state of the app
    // In a real app, you would typically make a network request here
    setState(() {});
  }

  @override
  Widget build(BuildContext conte) {
    futureUsers = fetchUsers();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 253, 253),
      appBar: AppBar(
        title: Text('قائمة كل الاولياء'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Go.to(context, AddParent());
            },
            icon: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: FutureBuilder<List<Parent>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("An error occurred"));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Parent user = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      Go.to(context, UserProfilePage(user: user));
                    },
                    child: Card(
                      child: ListTile(
                        leading: imageCached(image: UrlApp.site + user.image),
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        trailing: IconButton(
                            onPressed: () async {
                              makePhoneCall(user.phone.toString());
                            },
                            icon: Icon(
                              Icons.call,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Future<List<Parent>> fetchUsers() async {
  final response = await http
      .get(Uri.parse('https://areyouhere-app.com/public/api/users/all'));

  if (response.statusCode == 200) {
    List<dynamic> userJson = json.decode(response.body)['Parents'];
    return userJson.map((json) => Parent.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
