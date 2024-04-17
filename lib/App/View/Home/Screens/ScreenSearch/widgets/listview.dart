import 'package:app/App/Model/Parent.dart';
import 'package:app/App/Service/Api/Function/Search/searchPost.dart';
import 'package:flutter/material.dart';

import '../../../../../Service/ImageCach/imagecach.dart';
import '../../../../../Service/call/functioncall.dart';
import '../../../../../util/Const/url.dart';
import '../../../../../util/Route/go.dart';
import '../../../../Admine/Parents/profile.dart';
import '../../../../Widgets/dialogs.dart';
import '../../../home.dart';

FutureBuilder<List<Parent>> allPostsearch(cotext, String query) {
  return FutureBuilder(
    future: searchpost(cotext, query),
    builder: (BuildContext context, AsyncSnapshot<List<Parent>> snapshot) {
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
            Parent user = snapshot.data![index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onLongPress: () async {
                  await showDeleteConfirmationDialog(
                          context, 'users/delete/${user.id.toString()}',
                          title: "حذف ${snapshot.data![index].name}")
                      .then((value) => Go.push(Home()));
                },
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
