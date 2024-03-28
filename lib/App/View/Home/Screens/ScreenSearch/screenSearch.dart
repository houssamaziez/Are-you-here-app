import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/util/Size/dimensions.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizeApp.sizedboxh40,
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.brown,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
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
                )),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.brown,
                    radius: 20,
                    child: Icon(
                      Icons.filter_alt_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
