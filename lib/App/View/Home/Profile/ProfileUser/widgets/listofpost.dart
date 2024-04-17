import 'package:app/App/Model/post.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/cardpost.dart';

ListView listofpostprofile(
    {required List<Student>? userData, required catigoryid}) {
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
