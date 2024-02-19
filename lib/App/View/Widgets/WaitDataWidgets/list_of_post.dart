import 'package:app/App/View/Home/import_home.dart';

import '../../../util/Size/dimensions.dart';

ListView waitdatapost(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: SizedBox(
            height: SizeApp.heightmobile(context, size: 0.3),
            width: SizeApp.widthmobile(context, size: 1),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.3,
                    )),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: SizedBox(
            height: SizeApp.heightmobile(context, size: 0.3),
            width: SizeApp.widthmobile(context, size: 1),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.3,
                    )),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: SizedBox(
            height: SizeApp.heightmobile(context, size: 0.3),
            width: SizeApp.widthmobile(context, size: 1),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.3,
                    )),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
