import 'package:provider/provider.dart';

import '../../../../../Controller/PostController.dart';

initStateprofile(context, likes, idpsot) {
  PostController controller =
      Provider.of<PostController>(context, listen: false);
  Future.microtask(() {
    controller.disposevar();
    controller.updatlist(likes);
    controller.likesfunction(idpsot);
  });
}
