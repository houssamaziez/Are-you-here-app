import 'package:app/App/View/Home/import_home.dart';

import '../../../util/Size/dimensions.dart';

GridView waitdatapost() {
  return GridView.builder(
    physics:
        const NeverScrollableScrollPhysics(), // This line prevents scrolling
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 0.85),
    shrinkWrap: true,
    itemCount: 4,
    itemBuilder: (context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(borderRadius: SizeApp.raduis(11)),
                  width: SizeApp.widthmobile(context, size: 1),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
