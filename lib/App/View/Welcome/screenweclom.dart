import 'dart:async';

import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/View/Home/Home.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Welcome/inistateWelcome.dart';
import 'package:app/App/util/Image/pathimages.dart';

class ScreenWelcome extends StatefulWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  State<ScreenWelcome> createState() => _ScreenWelcomeState();
}

class _ScreenWelcomeState extends State<ScreenWelcome> {
  MyAppController? myData;
  bool iscomplet = false;

  @override
  void initState() {
    super.initState();
    instail();
  }

  instail() {
    Timer(const Duration(seconds: 3), () {
      InistateWelcome.inis().then((value) {
        if (value != null) {
          myData!.updateData(value);
          Timer(const Duration(seconds: 1), () {
            Go.push(Home());
          });
        }
      });
    });

    Timer(const Duration(seconds: 5), () {
      setState(() {
        iscomplet = true;
      });
    });
  }

  @override
  void dispose() {
    setState(() {
      iscomplet = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 220, 255),
      body: Stack(
        children: [
          Center(
            child: Image.asset(Images.logo),
          ),
          if (iscomplet == true)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  InistateWelcome.inis().then((value) {
                    if (value != null) {
                      myData!.updateData(value);
                      Timer(const Duration(seconds: 1), () {
                        Go.push(const Home());
                      });
                    }
                  });

                  setState(() {
                    iscomplet = false;
                  });
                  Timer(const Duration(seconds: 4), () {
                    setState(() {
                      iscomplet = true;
                    });
                  });
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            )
        ],
      ),
    );
  }
}
