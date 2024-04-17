import 'package:app/App/Controller/catigoryController.dart';
import 'package:app/App/View/Home/Screens/Notification/Note/sendNote.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';

import '../../../../../Model/note.dart';
import '../../../../../Service/Api/Function/Notification/getAllnotiification.dart';
import '../../../../../util/Convert/time.dart';

class ScreenNote extends StatelessWidget {
  const ScreenNote(
      {super.key,
      required this.id,
      required this.usersid,
      required this.id_notification});
  final String id;
  final String usersid;
  final String id_notification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Go.to(
                context,
                SendNote(
                    id_user: usersid.toInt(),
                    id_notification: id_notification.toInt()));
          },
          label: const Text('اضافة تعليق'),
          icon: const Icon(Icons.add),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'التعليقات',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            children: [
              SizeApp.sizedboxh20,
              Consumer<CatigorysController>(
                  builder: (context, myNotifier, child) {
                return listOfNote(id, usersid);
              })
            ],
          ),
        ));
  }
}

FutureBuilder<List<Note>> listOfNote(id, usersid) {
  return FutureBuilder(
    future: getallNote(id, usersid),
    builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('error'),
        );
      } else {
        List<Note>? userData = snapshot.data;
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Padding(
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
                                      // GetData.getpostbyid(
                                      //         userData[index].postId.toString())
                                      //     .then((value) => Go.to(
                                      //         context,
                                      //         ProfilePost(
                                      //             post: value,
                                      //             catigoryid: value.lavelId
                                      //                 .toString())));
                                    },
                                    icon: const Icon(
                                      Icons.person,
                                      size: 17,
                                      color: Colors.grey,
                                    )),
                              ],
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
                      ),
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
