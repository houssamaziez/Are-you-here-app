import 'package:app/App/Model/post.dart';
import 'package:app/App/Model/user.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/Service/Api/Function/api_operations.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Image/get_image_user.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';

Widget returndataUserImage() {
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

Widget returndatawidegtPost() {
  return FutureBuilder(
    future: GetDataPost.getall_post_user(id_user: 1.toString()),
    builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
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
        List<Post>? userData = snapshot.data;
        return GridView.builder(
          itemCount: userData!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: NetworkImage(
                            UrlApp.site + userData[index].image.toString())),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: SizeApp.heightmobile(context, size: 0.3),
                width: SizeApp.widthmobile(context, size: 0.1),
              ),
            );
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        );
      }
    },
  );
}
