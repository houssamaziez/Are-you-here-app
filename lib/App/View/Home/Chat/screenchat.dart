import 'package:app/App/View/Home/import_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screenchat extends StatelessWidget {
  const Screenchat({super.key, this.user});
  final user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("chat Screen"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.grey,
          )),
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: TextField(),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
