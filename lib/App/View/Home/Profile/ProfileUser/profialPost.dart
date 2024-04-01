// ignore_for_file: non_constant_identifier_names

import 'package:app/App/Controller/PostController.dart';
import 'package:app/App/Service/Api/Function/Get/getdata.dart';
import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/Service/Api/Function/Put/likes.dart';
import 'package:app/App/Service/Text%20Service/detectlang.dart';
import 'package:app/App/View/Home/Profile/ProfileUser/widgets/listofpost.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/BottomBar/bottombar_profile.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Convert/time.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:pie_menu/pie_menu.dart';
import 'dart:convert';
import '../../../../Model/post.dart';
import '../../../../util/Convert/Stringtolist.dart';

class ProfilePost extends StatefulWidget {
  const ProfilePost({super.key, required this.post, required this.catigoryid});
  final Post post;
  final String catigoryid;

  @override
  State<ProfilePost> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost> {
  bool islike = false;
  int? lengthoflike;
  int price = 1;

  @override
  void initState() {
    Provider.of<PostController>(context, listen: false).disposevar();

    setState(() {
      lengthoflike =
          (json.decode(widget.post.likes!).cast<String>().toList()).length;
    });
    likesfunction();

    super.initState();
  }

  void likesfunction() {
    isUserLikedPost(widget.post.id.toString(), widget.post.userId.toString())
        .then((value) => setState(() {
              islike = value;
              print(islike);
              GetData.getpost(widget.post.id).then((value) => setState(() {
                    lengthoflike =
                        (json.decode(value.likes!).cast<String>().toList())
                            .length;
                  }));
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        appBar: AppBar(
          title: Text(widget.post.title.toString()),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        bottomNavigationBar: buttonbarProfile(context, post: widget.post),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  imageprofile(
                    context,
                  ),
                  Column(
                    children: [
                      SizeApp.sizedboxh10,
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 0, left: 8, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizeApp.sizedboxh10,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Price :',
                                    style: TextStyle(
                                        height: 0.8,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Consumer<PostController>(
                                      builder: (context, myNotifier, child) {
                                    return Text(
                                      '${double.parse((myNotifier.pricex * widget.post.price.toDouble()).toStringAsFixed(2))}',
                                      style: const TextStyle(
                                          height: 0.8,
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    );
                                  }),
                                  const Text(
                                    'DA',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 12,
                                        height: 1.2,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Buttons.buttonCircle(context,
                                            onPressed: () {
                                          Provider.of<PostController>(context,
                                                  listen: false)
                                              .sub();
                                        }, icon: Icons.remove, raduis: 17),
                                        Consumer<PostController>(builder:
                                            (context, myNotifier, child) {
                                          return Text(
                                            "${myNotifier.pricex}",
                                            style: const TextStyle(fontSize: 17),
                                          );
                                        }),
                                        Buttons.buttonCircle(context,
                                            onPressed: () {
                                          Provider.of<PostController>(context,
                                                  listen: false)
                                              .add();
                                        }, icon: Icons.add, raduis: 17),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizeApp.sizedboxh5,
                              const Text(
                                "Prix hors texe",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              SizeApp.sizedboxh20,
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.brown,
                                    size: 17,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Wilaya : ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  Text(
                                    widget.post.wilaya.toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                              SizeApp.sizedboxh10,
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.brown,
                                    size: 17,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Time : ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  Text(
                                    convertToDateString(
                                        widget.post.createdAt.toString()),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                              SizeApp.sizedboxh20,
                            ],
                          ),
                        ),
                      ),
                      SizeApp.sizedboxh10,
                      details(),
                      you_will_like(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container you_will_like() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizeApp.sizedboxh10,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "You will like also :",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizeApp.sizedboxh10,
          SizedBox(
              height: 200,
              width: double.infinity,
              child: FutureBuilder(
                future: GetDataPost.getall_post_Catigory_profile(
                    id_catigory: widget.catigoryid.toString(),
                    wilaya: userwilaya.read('wilaya'),
                    idpost: widget.post.id.toString()),
                // initialData: InitialData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return waitdatapost(context);
                  } else if (snapshot.hasError) {
                    // Show an error message if the data fetching fails
                    return waitdatapost(context);
                  } else {
                    // Build your UI based on the fetched data
                    List<Post>? userData = snapshot.data;
                    return listofpostprofile(
                        userData: userData, catigoryid: widget.catigoryid);
                  }
                },
              )),
        ],
      ),
    );
  }

  Padding details() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Details :",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizeApp.sizedboxh20,
              Text(
                widget.post.details.toString(),
                textAlign: isArabic(widget.post.details.toString())
                    ? TextAlign.right
                    : TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox imageprofile(
    BuildContext context,
  ) {
    PostController controllerPost = Provider.of<PostController>(context);

    PageController pageController =
        PageController(); // PageController for PageView
    List Images = parseImageList(widget.post.image.toString()).toList();
    return SizedBox(
      height: SizeApp.heightmobile(context, size: 0.53),
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: SizeApp.heightmobile(context, size: 0.7),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
              // child: imageCached(
              //     image: UrlApp.site + widget.post.image.toString()),
              child: PageView.builder(
                controller: pageController,
                allowImplicitScrolling: true,
                onPageChanged: (value) {
                  controllerPost.onChangedimage(value);
                },
                itemCount: Images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    '${UrlApp.site}images/' + Images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 15,
              right: 20,
              child: InkWell(
                onTap: () {
                  addLikeToPost(
                          widget.post.id!.toInt(), widget.post.userId!.toInt())
                      .then((value) => isUserLikedPost(
                              widget.post.id.toString(),
                              widget.post.userId.toString())
                          .then((value) => setState(() {
                                islike = value;
                                GetData.getpost(widget.post.id)
                                    .then((value) => setState(() {
                                          lengthoflike = (json
                                                  .decode(value.likes!)
                                                  .cast<String>()
                                                  .toList())
                                              .length;
                                        }));
                              })));
                },
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          islike == true
                              ? Icons.favorite
                              : Icons.favorite_border_rounded,
                          color: islike == true ? Colors.red : Colors.black,
                          size: 20,
                        ),
                        Text(
                          "$lengthoflike",
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              right: SizeApp.widthmobile(context, size: 0.44),
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<PostController>(
                          builder: (context, myNotifier, child) {
                        return Text(
                          "${myNotifier.currentPageIndex + 1}/${Images.length}",
                          style: const TextStyle(fontSize: 12),
                        );
                      })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
