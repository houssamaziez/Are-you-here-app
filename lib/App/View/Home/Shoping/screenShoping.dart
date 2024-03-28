import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Size/dimensions.dart';

class ScreenShoping extends StatelessWidget {
  const ScreenShoping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shoping profile '),
        centerTitle: true,
      ),
      body: Column(
        children: [Container(height: SizeApp.heightmobile(context, size: 0.5))],
      ),
    );
  }
}
