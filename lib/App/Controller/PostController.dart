import 'dart:convert';

import 'package:app/App/Service/Api/Function/Put/likes.dart';
import 'package:app/App/View/Home/import_home.dart';

import '../Service/Api/Function/Get/getdata.dart';
import '../Service/Api/Function/Notification/push.dart';

class PostController extends ChangeNotifier {
  String query = '';
  int currentPageIndex = 0;
  int pricex = 01;
  onChanged(value) {
    query = value;
    notifyListeners();
  }

  bool islike = false;
  int? lengthoflike;
  int price = 1;

  updatlist(likes) {
    lengthoflike = (json.decode(likes).cast<String>().toList()).length;
    notifyListeners();
  }

  void likesfunction(idpost) {
    isUserLikedPost(idpost, userid.read('iduser').toString()).then((value) {
      islike = value;
      notifyListeners();
      GetData.getpost(idpost).then((value) => updatlist(value.likes!));
    });
  }

  ontap(postid, userId) {
    addLikeToPost(postid, userid.read('iduser'.toString())).then((value) =>
        isUserLikedPost(postid, userid.read('iduser').toString()).then((value) {
          islike = value;
          notifyListeners();

          value == true
              ? pushNotification(
                      id: userId,
                      title: 'Your post',
                      post_id: postid,
                      description: lengthoflike! >= 2
                          ? 'and $lengthoflike others liked your post'
                          : 'liked your post')
                  .then((value) => print('complet send'))
              : () {};
          GetData.getpost(postid).then((value) => updatlist(value.likes!));
        }));
  }

  sub() {
    if (pricex > 1) {
      pricex--;
      notifyListeners();
    }
  }

  add() {
    pricex++;
    notifyListeners();
  }

  String newPrice(price) {
    return '${price * pricex}';
  }

  disposevar() {
    currentPageIndex = 0;
    notifyListeners();
    pricex = 1;
    notifyListeners();
  }

  onChangedimage(value) {
    currentPageIndex = value;
    notifyListeners();
  }

  @override
  void dispose() {
    currentPageIndex = 0;
    notifyListeners();
    pricex = 1;
    notifyListeners();
    super.dispose();
  }
}
