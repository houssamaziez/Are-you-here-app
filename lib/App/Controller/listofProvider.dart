import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Service/Api/Function/api_operations.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> listofprovider = [
  ChangeNotifierProvider(create: (_) => ApiOperation()),
  ChangeNotifierProvider(create: (_) => MyAppController()),
  ChangeNotifierProvider(create: (_) => ControllerLocation()),
  ChangeNotifierProvider(create: (_) => HomeController()),
];
