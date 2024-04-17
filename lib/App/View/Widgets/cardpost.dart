import 'dart:convert';

import 'package:app/App/Model/post.dart';
import 'package:app/App/Service/Api/Function/Delete/delete.dart';
import 'package:app/App/Service/ImageCach/imagecach.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Convert/time.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../util/Convert/Stringtolist.dart';

SizedBox card_post(BuildContext context, List<Student> userData, int index,
    Function delete, catigoryid) {
  // int likelength =
  //     (json.decode(userData[index].n).cast<String>().toList()).length;
  return SizedBox(
    width: 160,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: PieMenu(
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
              child: Container(
                // ignore: sort_child_properties_last
                child: Stack(
                  children: [
                    imageCached(
                        image:
                            '${UrlApp.site}images/${userData[index].image.toString()}'),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: SizeApp.raduis(11)),
                width: SizeApp.widthmobile(context, size: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'DA',
                            style: TextStyle(
                                fontSize: 12,
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Text(
                            '${userData[index].name}',
                            style: const TextStyle(
                                height: 0.8,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      Text(
                        userData[index].name.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        convertToDateString(
                            userData[index].createdAt.toString()),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        'Likes: ',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ],
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
