import 'package:app/App/View/Home/Profile/ProfileUser/profialPost.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Convert/time.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/notification.dart';
import '../../../../../Service/Api/Function/Get/getdata.dart';
import '../../../../../Service/Api/Function/Notification/getAllnotiification.dart';

FutureBuilder<List<Notificationapp>> listOfNotification() {
  return FutureBuilder(
    future: getallNotification(),
    builder:
        (BuildContext context, AsyncSnapshot<List<Notificationapp>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container();
      } else if (snapshot.hasError) {
        return Container();
      } else {
        List<Notificationapp>? userData = snapshot.data;
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            GetData.getpostbyid(
                                    userData[index].postId.toString())
                                .then((value) => Go.to(
                                    context,
                                    ProfilePost(
                                        post: value,
                                        catigoryid:
                                            value.catigoryId.toString())));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.notification_important,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  userData[index].title.toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      GetData.getpostbyid(
                                              userData[index].postId.toString())
                                          .then((value) => Go.to(
                                              context,
                                              ProfilePost(
                                                  post: value,
                                                  catigoryid: value.catigoryId
                                                      .toString())));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 17,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: SizeApp.widthmobile(context, size: 0.7),
                            child: Text(
                              userData[index].details.toString(),
                              style: TextStyle(),
                            )),
                        Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                gettime(userData[index].createdAt.toString()),
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ),
                            )),
                        SizeApp.sizedboxh10,
                        Container(
                          height: 1,
                          width: SizeApp.widthmobile(context, size: 0.87),
                          color: Colors.grey.shade300,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}
