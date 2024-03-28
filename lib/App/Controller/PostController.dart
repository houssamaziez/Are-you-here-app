import 'package:app/App/View/Home/import_home.dart';

class PostController extends ChangeNotifier {
  String query = '';

  onChanged(value) {
    query = value;
    notifyListeners();
  }
}
