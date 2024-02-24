import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Size/dimensions.dart';

class CardPost extends StatelessWidget {
  const CardPost(
      {super.key,
      required this.title,
      required this.image,
      required this.idpost});
  final String title, image, idpost;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeApp.heightmobile(context, size: 0.2),
      width: SizeApp.widthmobile(context, size: 0.3),
    );
  }
}
