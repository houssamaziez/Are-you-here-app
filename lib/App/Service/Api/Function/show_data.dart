import 'package:app/App/Model/post.dart';
import 'package:app/App/Model/user.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/Service/Api/Function/api_operations.dart';
import 'package:app/App/Service/Api/Function/Delete/delete.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Image/get_image_user.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../View/Widgets/WaitDataWidgets/list_of_post.dart';

Widget returndataUserImage(String id) {
  return FutureBuilder(
    future: ApiOperation.getuserData(int.parse(id)),
    builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Show a loading indicator while the data is being fetched
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: CircularProgressIndicator(
                strokeWidth: 1.3,
              )),
        );
      } else if (snapshot.hasError) {
        // Show an error message if the data fetching fails
        return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.error,
              ),
            ));
      } else {
        // Build your UI based on the fet ched data
        UserData? userData = snapshot.data;
        return GetImageUser.returnimageiser(
            nameofuser: userData!.user!.name.toString());
      }
    },
  );
}

Widget returndatawidegt() {
  return FutureBuilder(
    future: ApiOperation.getuserData(int.parse(userid.read('iduser'))),
    builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Show a loading indicator while the data is being fetched
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: CircularProgressIndicator(
                strokeWidth: 1.3,
              )),
        );
      } else if (snapshot.hasError) {
        // Show an error message if the data fetching fails
        return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.error,
              ),
            ));
      } else {
        // Build your UI based on the fetched data
        UserData? userData = snapshot.data;
        return Column(
          children: [
            Text(userData!.user!.name.toString()),
            Text(userData.user!.email.toString()),
          ],
        );
      }
    },
  );
}
