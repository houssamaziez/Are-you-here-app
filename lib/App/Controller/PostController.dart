import 'package:app/App/View/Home/import_home.dart';

class PostController extends ChangeNotifier {
  String query = '';
  int currentPageIndex = 0;
  int pricex = 01;
  onChanged(value) {
    query = value;
    notifyListeners();
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
