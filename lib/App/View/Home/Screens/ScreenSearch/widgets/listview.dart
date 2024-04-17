import 'package:app/App/Model/Parent.dart';
import 'package:app/App/Service/Api/Function/Search/searchPost.dart';
import 'package:flutter/material.dart';

import '../../../../../Service/ImageCach/imagecach.dart';
import '../../../../../Service/call/functioncall.dart';
import '../../../../../util/Const/url.dart';
import '../../../../../util/Route/go.dart';
import '../../../../Admine/Parents/profile.dart';

FutureBuilder<List<User>> allPostsearch(cotext, String query) {
  return FutureBuilder(
    future: searchpost(cotext, query),
    builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container();
      } else if (snapshot.hasError) {
        return Container();
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            User user = snapshot.data![index];
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
      }
    },
  );
}
