import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Size/dimensions.dart';

import '../../../../Model/post.dart';

class ProfilePost extends StatelessWidget {
  ProfilePost({super.key, required this.post});
  final Posts post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Hero(
                tag: post.id.toString(),
                child: Expanded(
                  child: Container(
                    width: double.infinity,
                    height: SizeApp.heightmobile(context, size: 0.5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              UrlApp.site + post.image.toString(),
                            )),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                  ),
                ),
              ),
              SizeApp.sizedboxh10,
              Text(
                post.title.toString(),
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                post.details.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Buttons.buttonAll(context,
                    title: 'Add to', color: Colors.brown, functinn: () {}),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
          )
        ],
      ),
    );
  }
}
