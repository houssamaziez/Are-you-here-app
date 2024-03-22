import 'package:app/App/View/Home/import_home.dart';
import 'package:cached_network_image/cached_network_image.dart';

imageCached({required String image}) {
  return CachedNetworkImage(
    imageUrl: image,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.brown,
    )),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
