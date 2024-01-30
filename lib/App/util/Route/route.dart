import 'package:app/App/View/Home/screenHome.dart';
import 'package:app/App/util/Route/go.dart';

class RouteApp {
  static gotHome(context) {
    Go.to(context, ScreenHome());
  }
}
