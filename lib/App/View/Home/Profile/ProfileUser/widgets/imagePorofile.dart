import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Controller/PostController.dart';
import '../../../../../Model/post.dart';
import '../../../../../util/Const/url.dart';
import '../../../../../util/Convert/Stringtolist.dart';
import '../../../../../util/Size/dimensions.dart';

SizedBox imageprofile(BuildContext context, Post post) {
  PageController pageController =
      PageController(); // PageController for PageView
  List Images = parseImageList(post.image.toString()).toList();
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
                Provider.of<PostController>(context).onChangedimage(value);
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
                Provider.of<PostController>(context, listen: false)
                    .ontap(post.id!.toString(), post.userId!.toString());
              },
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Consumer<PostController>(
                    builder: (context, myNotifier, child) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          myNotifier.islike == true
                              ? Icons.favorite
                              : Icons.favorite_border_rounded,
                          color: myNotifier.islike == true
                              ? Colors.red
                              : Colors.black,
                          size: 20,
                        ),
                        Text(
                          "${myNotifier.lengthoflike}",
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  );
                }),
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
