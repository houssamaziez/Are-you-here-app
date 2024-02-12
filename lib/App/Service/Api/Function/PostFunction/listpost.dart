// import 'package:app/App/Model/post.dart';
// import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
// import 'package:app/App/Service/Api/Function/api_operations.dart';
// import 'package:app/App/View/Home/import_home.dart';
// import 'package:app/App/util/Image/get_image_user.dart';

// Widget returndataUserImage() {
//   return FutureBuilder(
//     future: GetDataPost.getall_post_user(
//       id_user: userid.read('iduser'),
//     ),
//     builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         // Show a loading indicator while the data is being fetched
//         return const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: CircleAvatar(
//               backgroundColor: Colors.grey,
//               child: CircularProgressIndicator(
//                 strokeWidth: 1.3,
//               )),
//         );
//       } else if (snapshot.hasError) {
//         // Show an error message if the data fetching fails
//         return const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey,
//               child: Icon(
//                 Icons.error,
//               ),
//             ));
//       } else {
//         // Build your UI based on the fetched data
//         List<Post> userData = snapshot.data;
//         return GetImageUser.returnimageiser(nameofuser: userData.toString());
//       }
//     },
//   );
// }
