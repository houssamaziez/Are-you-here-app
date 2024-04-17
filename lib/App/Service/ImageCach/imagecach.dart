import 'package:app/App/View/Home/import_home.dart';
import 'package:cached_network_image/cached_network_image.dart';

ClipRRect imageCached(
    {required String image, double height = 50, double width = 50}) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(200)),
    child: CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.brown,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}
