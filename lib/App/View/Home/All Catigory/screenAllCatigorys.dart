import 'package:app/App/Controller/catigoryController.dart';
import 'package:app/App/View/Home/All%20Catigory/Widgets/listview.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Size/dimensions.dart';

class ScreenAllCatigorys extends StatelessWidget {
  const ScreenAllCatigorys({super.key});

  @override
  Widget build(BuildContext context) {
    var controllerlocation = Provider.of<CatigorysController>(context);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            children: [
              const Text(
                'Categorys',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizeApp.sizedboxh5,
              const Text(
                'Select the option that you think fits best ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizeApp.sizedboxh20,
              Container(
                width: double.infinity,
                height: 45,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 209, 209, 209),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 237, 237, 237),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.search,
                          color: Colors.brown,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          onChanged: (value) {
                            controllerlocation.onChanged(value);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            // Remove underline by setting border to InputBorder.none

                            border: InputBorder.none,
                          ),
                        ))
                        // Text(
                        //   'Search',
                        //   style: TextStyle(color: Colors.grey, fontSize: 17),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              Consumer<CatigorysController>(
                  builder: (context, myNotifier, child) {
                return allcatigorys(context, myNotifier.query);
              })
            ],
          ),
        ));
  }
}
