import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/Service/ImageCach/imagecach.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/BottomBar/bottombar_profile.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/View/Widgets/cardpost.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../../Model/post.dart';

class ProfilePost extends StatelessWidget {
  const ProfilePost({super.key, required this.post, required this.catigoryid});
  final Posts post;
  final String catigoryid;
  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      theme: const PieTheme(
        rightClickShowsMenu: true,
        tooltipTextStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: buttonbarProfile(context, post: post),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
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
                                          icon:
                                              Icons.arrow_back_ios_new_rounded,
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
                  SizeApp.sizedboxh20,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      post.details.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      height: 160,
                      width: double.infinity,
                      child: FutureBuilder(
                        future: GetDataPost.getall_post_Catigory(
                            id_catigory: catigoryid.toString(),
                            wilaya: userwilaya.read('wilaya')),
                        // initialData: InitialData,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return waitdatapost(context);
                          } else if (snapshot.hasError) {
                            // Show an error message if the data fetching fails
                            return waitdatapost(context);
                          } else {
                            // Build your UI based on the fetched data
                            List<Posts>? userData = snapshot.data;
                            return listofpost(
                                userData: userData, catigoryid: catigoryid);
                          }
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView listofpost({required List<Posts>? userData, required catigoryid}) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: userData!.length,
      itemBuilder: (context, index) {
        return card_post(
          context,
          userData,
          index,
          () {},
          catigoryid,
        );
      },
    );
  }
}
