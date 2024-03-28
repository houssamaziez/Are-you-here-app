import 'package:app/App/Model/post.dart';
import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/Service/Api/Function/Delete/delete.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';
import 'package:app/App/View/Widgets/cardpost.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:pie_menu/pie_menu.dart';

class ListOfPostUser extends StatefulWidget {
  const ListOfPostUser({super.key, required this.iduser});
  final String iduser;
  @override
  State<ListOfPostUser> createState() => _ListOfPostUserState();
}

class _ListOfPostUserState extends State<ListOfPostUser> {
  Widget returndatawidegtPost() {
    return FutureBuilder(
      future: GetDataPost.getall_post_user(id_user: widget.iduser),
      builder: (BuildContext context, AsyncSnapshot<List<Posts>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitdatapost(context);
        } else if (snapshot.hasError) {
          // Show an error message if the data fetching fails
          return waitdatapost(context);
        } else {
          // Build your UI based on the fetched data
          List<Posts>? userData = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: userData!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PieMenu(
                  onPressed: () => print('pressed'),
                  actions: [
                    PieAction(
                      tooltip: const Text('Delelte'),
                      onSelect: () =>
                          ApiDelete.deleteData(userData[index].id.toString())
                              .then((value) => setState(() {})),
                      child: const Icon(Icons.delete), // Can be any widget
                    ),
                    PieAction(
                      tooltip: const Text('like'),
                      onSelect: () =>
                          ApiDelete.deleteData(userData[index].id.toString()),
                      child: const Icon(Icons.favorite), // Can be any widget
                    ),
                  ],
                  child: Card(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            height: 50,
                            child: returndataUserImage(
                                userData[index].userId.toString()),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(UrlApp.site +
                                      userData[index].image.toString())),
                              borderRadius: SizeApp.raduis(11)),
                          height: SizeApp.heightmobile(context, size: 0.3),
                          width: SizeApp.widthmobile(context, size: 1),
                          child: Container(
                            child: Column(
                              children: [
                                const Spacer(),
                                Text(
                                  userData[index].title.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                SizeApp.sizedboxh10
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return returndatawidegtPost();
  }
}

GridView listofpost(List<Posts>? userData) {
  return GridView.builder(
    physics:
        const NeverScrollableScrollPhysics(), // This line prevents scrolling
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 0.85),
    shrinkWrap: true,
    itemCount: userData!.length,
    itemBuilder: (context, index) {
      return card_post(
        context,
        userData,
        index,
        () {
          // ApiDelete.deleteData(userData[index].id.toString())
          //     .then((value) => setState(() {}));
        },
        userData[index].catigoryId.toString(),
      );
    },
  );
}
