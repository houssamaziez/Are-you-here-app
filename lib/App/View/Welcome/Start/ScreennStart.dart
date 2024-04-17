// ignore_for_file: file_names

import 'package:app/App/Controller/controllerStart.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Welcome/Start/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Auth/Sign in/screensignin.dart';
import '../../Widgets/buttons.dart';

class ScreenStart extends StatelessWidget {
  const ScreenStart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 167, 220, 255),
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                Go.to(context, ScreenSignin());
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 167, 220, 255),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Buttons.buttonAll(context,
                  title: 'next', functinn: () {}, color: Colors.brown),
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: GetBuilder<ControllerStart>(
                    init: ControllerStart(),
                    builder: (_controller) {
                      return PageView.builder(
                        controller: _controller.controllerpage,
                        itemCount: listStart.length,
                        itemBuilder: (context, index) => Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: double.infinity,
                          child: Column(
                            children: [
                              listStart[index].title != "مزايا التطبيق "
                                  ? Image.asset(
                                      listStart[index].image,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                    )
                                  : Container(),
                              Text(listStart[index].title,
                                  style: MyTexStyle.titlestyle),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(listStart[index].details,
                                    textAlign: TextAlign.center,
                                    style: MyTexStyle.suptitlestyle),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Buttons.buttonAll(context,
                    title: 'Next',
                    color: Theme.of(context).primaryColor, functinn: () {
                  Get.put(ControllerStart()).chngeindext(context);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTexStyle {
  static TextStyle titlestyle =
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  static TextStyle titlestyleHOME =
      TextStyle(fontSize: 26, color: Color.fromARGB(255, 255, 178, 24));
  static TextStyle suptitlestyle = TextStyle(
    fontSize: 20,
  );
}
