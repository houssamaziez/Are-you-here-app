import 'package:app/App/View/Home/Chat/screenchat.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/buttons.dart';

Card buttonbarProfile(context, {required post}) {
  return Card(
    child: Container(
      width: double.infinity,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            child: Row(children: [
          IconButton(
            onPressed: () {
              Go.to(
                  context,
                  ScreenProfileUser(
                    idusr: post.userId.toString(),
                  ));
            },
            icon: Column(
              children: [
                Image.asset(
                  "assets/images/seller.png",
                  fit: BoxFit.cover,
                  height: 25,
                ),
                Text('the seller',
                    style: TextStyle(color: Colors.grey, fontSize: 8)),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Go.to(context, Screenchat());
            },
            icon: Column(
              children: [
                Image.asset(
                  "assets/images/messenger.png",
                  fit: BoxFit.cover,
                  height: 25,
                ),
                Text('Message',
                    style: TextStyle(color: Colors.grey, fontSize: 8)),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            child: Buttons.buttonAll(context,
                title: "Add to card", color: Colors.brown, functinn: () {}),
          ))
        ])),
      ),
    ),
  );
}
