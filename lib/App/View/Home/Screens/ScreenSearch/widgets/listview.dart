import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/Service/Api/Function/Get/getdata.dart';
import 'package:app/App/Service/Api/Function/Search/searchCatigory.dart';
import 'package:app/App/Service/Api/Function/Search/searchPost.dart';
import 'package:app/App/Service/FutureBuild/list_of_post_user.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';

FutureBuilder<List<Posts>> allPostsearch(cotext, String query) {
  return FutureBuilder(
    future: searchpost(cotext, query),
    builder: (BuildContext context, AsyncSnapshot<List<Posts>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container();
      } else if (snapshot.hasError) {
        return Container();
      } else {
        List<Posts>? userData = snapshot.data;
        return listofpost(userData);
      }
    },
  );
}
