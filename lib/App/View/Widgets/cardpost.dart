import 'package:app/App/Model/post.dart';
import 'package:app/App/Service/Api/Function/Delete/delete.dart';
import 'package:app/App/Service/ImageCach/imagecach.dart';
import 'package:app/App/View/Home/Profile/ProfileUser/profialPost.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:pie_menu/pie_menu.dart';

SizedBox card_post(BuildContext context, List<Posts> userData, int index,
    Function delete, catigoryid) {
  return SizedBox(
    width: 130,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: PieMenu(
        onPressed: () => Go.to(
            context,
            ProfilePost(
              post: userData[index],
              catigoryid: catigoryid,
            )),
        actions: [
          PieAction(
            tooltip: const Text('Delelte'),
            onSelect: () => delete(),
            child: const Icon(Icons.delete), // Can be any widget
          ),
          PieAction(
            tooltip: const Text('like'),
            onSelect: () => ApiDelete.deleteData(userData[index].id.toString()),
            child: const Icon(Icons.favorite), // Can be any widget
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: userData[index].id.toString(),
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Stack(
                    children: [
                      imageCached(
                          image:
                              UrlApp.site + userData[index].image.toString()),
                      Column(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Buttons.buttonCircle(context,
                                  icon: Icons.favorite_outline_rounded,
                                  raduis: 15,
                                  onPressed: () {}),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(borderRadius: SizeApp.raduis(11)),
                  width: SizeApp.widthmobile(context, size: 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData[index].title.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    '\$${userData[index].price}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
