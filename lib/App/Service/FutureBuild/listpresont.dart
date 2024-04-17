// // ignore_for_file: sort_child_properties_last

// import 'package:app/App/Model/post.dart';
// import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
// import 'package:app/App/Service/FutureBuild/list_of_post_user.dart';
// import 'package:app/App/View/Home/import_home.dart';
// import 'package:app/App/View/Widgets/WaitDataWidgets/list_of_post.dart';

// class ListOfPresont extends StatefulWidget {
//   ListOfPresont({super.key, required this.idlavel});
//   final String idlavel;
//   @override
//   State<ListOfPresont> createState() => _ListOfPresontState();
// }

// class _ListOfPresontState extends State<ListOfPresont> {
//   late HomeController controllerHome;
//   @override
//   void initState() {
//     controllerHome = Provider.of<HomeController>(context, listen: false);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     Future.microtask(() {
//       controllerHome.changeIndexcatigory(1.toString());
//     });
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: GetDataPost.getall_Student(),
//       // initialData: InitialData,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return waitdatapost(context);
//         } else if (snapshot.hasError) {
//           // Show an error message if the data fetching fails
//           return waitdatapost(context);
//         } else {
//           // Build your UI based on the fetched data
//           List<Student>? userData = snapshot.data;
//           return listofpost(
//             userData!,
//           );
//         }
//       },
//     );
//   }
// }
