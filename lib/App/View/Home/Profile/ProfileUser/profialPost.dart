import 'package:app/App/Service/ImageCach/imagecach.dart';
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
              Container(
                height: SizeApp.heightmobile(context, size: 0.5),
                child: SizedBox(
                  child: Stack(
                    children: [
                      Hero(
                        tag: post.id.toString(),
                        child: Container(
                          width: double.infinity,
                          height: SizeApp.heightmobile(context, size: 0.5),
                          child: imageCached(
                              image: UrlApp.site + post.image.toString()),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                        ),
                      ),
                      Container(
                        height: SizeApp.heightmobile(context, size: 0.5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 10, right: 10),
                              child: Row(
                                children: [
                                  Buttons.buttonCircle(context,
                                      icon: Icons.arrow_back_ios_new_rounded,
                                      onPressed: () {
                                    Navigator.pop(context);
                                  }),
                                  Spacer(),
                                  Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          post.title.toString(),
                                          style: TextStyle(fontSize: 21),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          post.title.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Buttons.buttonCircle(context,
                                      icon: Icons.favorite_border_rounded,
                                      onPressed: () {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
        ],
      ),
    );
  }
}
