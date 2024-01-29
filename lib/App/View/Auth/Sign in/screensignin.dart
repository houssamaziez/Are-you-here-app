import 'package:app/App/Controller/Auth/authController.dart';
import 'package:app/App/Model/user.dart';
import 'package:app/App/View/Auth/Register%20Account/screenRegister.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/View/Widgets/textfild.dart';
import 'package:app/App/util/Const/text_app.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:app/App/util/theme/Style/styles.dart';
import 'package:flutter/material.dart';

import '../../../util/Route/route.dart';

class ScreenSignin extends StatefulWidget {
  const ScreenSignin({super.key});

  @override
  State<ScreenSignin> createState() => _ScreenSigninState();
}

class _ScreenSigninState extends State<ScreenSignin> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, leading: Buttons.ButtonBack(context)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeApp.heightmobile(context, size: 0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                const Text(
                  TextApp.helloAgain,
                  style: StyleApp.title,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  TextApp.helloAgainsup,
                  style: StyleApp.suptitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            Textfildapp.myTextfilde(
                                controller: emailController,
                                hin: 'xyz@gmail.com',
                                title: TextApp.emailAddress),
                            const SizedBox(
                              height: 20,
                            ),
                            Textfildapp.myTextfilde(
                                controller: passwordController,
                                hin: '**********',
                                title: TextApp.password),
                            const SizedBox(
                              height: 30,
                            ),
                            MaterialButton(
                                color: Colors.amber,
                                onPressed: () async {
                                  await AuthController()
                                      .login(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then(
                                          (value) => RouteApp.gotHome(context));
                                }),
                            Buttons.buttonAll(context,
                                title: TextApp.signIn,
                                color: Theme.of(context).primaryColor,
                                functinn: () {}),
                            const SizedBox(
                              height: 25,
                            ),
                            Buttons.buttonAll(context,
                                title: TextApp.signInwithGoogle,
                                isgoogle: true,
                                color: const Color.fromARGB(255, 235, 235, 235),
                                functinn: () {}),
                          ],
                        ),
                      ),
                    )),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Go.to(context, ScreenRegister());
                  },
                  child: const Text(
                    TextApp.newUsCreateaccount,
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
