import 'dart:convert';
import 'package:app/App/View/Welcome/inistateWelcome.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../Model/Parent.dart';
import '../../../Model/post.dart';
import '../../../Service/Api/Bdd/local/auth.dart';
import '../../../Service/Api/Function/Put/user.dart';
import '../../../Service/ImageCach/imagecach.dart';
import '../../../Service/call/functioncall.dart';
import '../../../util/Const/url.dart';
import '../../../util/Route/go.dart';
import '../../Auth/Sign in/screensignin.dart';
import '../../Home/Screens/Notification/Send Notification/screenSendNotification.dart';

class UserProfilePage extends StatefulWidget {
  final Parent user;

  const UserProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    ApiPut.getuserData(userid.read('iduser'))
        .then((value) => userDataapp = value);
    print(userDataapp!.id);
    super.initState();
  }

  void _logout() async {
    await userid
        .write('iduser', null)
        .then((value) => Go.push(const ScreenSignin()));
  }

  void _selectedItem(BuildContext context, int item) {
    switch (item) {
      case 0:
        _logout();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            actions: [
              widget.user.id == int.parse(userid.read('iduser'))
                  ? PopupMenuButton<int>(
                      onSelected: (item) => _selectedItem(context, item),
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Text('Logout'),
                        ),
                      ],
                    )
                  : IconButton(
                      onPressed: () {
                        Go.to(
                            context,
                            SendNotification(
                              id_user: widget.user.id,
                            ));
                      },
                      icon: Icon(Icons.add_alert)),
              SizedBox(
                width: 10,
              )
            ],
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.user.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
              background: Image.network(
                UrlApp.site + widget.user.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              UserInfoSection(user: widget.user),
              Divider(),
              UserActivitiesSection(user: widget.user),
            ]),
          ),
        ],
      ),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  final Parent user;

  const UserInfoSection({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              makePhoneCall(user.phone.toString());
            },
            child: Card(
              elevation: 0.33,
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text(user.phone.toString()),
              ),
            ),
          ),
          Card(
            elevation: 0.33,
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text(user.email),
            ),
          ),
          Card(
            elevation: 0.33,
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text(user.address),
            ),
          ),
        ],
      ),
    );
  }
}

class UserActivitiesSection extends StatefulWidget {
  final Parent user;

  UserActivitiesSection({Key? key, required this.user}) : super(key: key);

  @override
  State<UserActivitiesSection> createState() => _UserActivitiesSectionState();
}

class _UserActivitiesSectionState extends State<UserActivitiesSection> {
  late Future<List<Student>> futureUsers;
  @override
  void initState() {
    super.initState();
    futureUsers = fetchstudent(widget.user.id);
  }

  @override
  Widget build(BuildContext context) {
    // Placeholder for user activities
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        children: [
          Text("قائمة الأولاد",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          FutureBuilder<List<Student>>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("An error occurred"));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Student student = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        // Go.to(context, UserProfilePage(user: user));
                      },
                      child: Card(
                        color: student.isPresent == "true"
                            ? Color.fromARGB(255, 194, 255, 196)
                            : Colors.white,
                        child: ListTile(
                          trailing: student.isPresent == "true"
                              ? Text("حاضر")
                              : Text("غائب"),
                          leading: imageCached(
                              image: UrlApp.site +
                                  'images/' +
                                  student.image.toString()),
                          title: Text(student.name.toString()),
                          subtitle: Text(student.classs.toString()),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      // This would typically include a list of recent activities, posts, etc.
    );
  }
}

Future<List<Student>> fetchstudent(id) async {
  final response = await http.get(Uri.parse('${UrlApp.host}Student/user/$id'));

  if (response.statusCode == 200) {
    List<dynamic> userJson = json.decode(response.body);
    return userJson.map((json) => Student.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
