import 'package:app/App/Controller/Auth/authController.dart';
import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/View/Widgets/textfild.dart';
import 'package:app/App/util/Const/text_app.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:app/App/util/theme/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../util/Route/route.dart';

class ScreenRegister extends StatefulWidget {
  ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController namelController = TextEditingController();
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
          child: Container(
            height: SizeApp.heightmobile(context, size: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                const Text(
                  TextApp.registerAccount,
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
                                controller: namelController,
                                hin: 'name',
                                title: TextApp.yourName),
                            const SizedBox(
                              height: 20,
                            ),
                            Textfildapp.myTextfilde(
                                controller: emailController,
                                hin: 'xyz@gmail.com',
                                title: TextApp.yourName),
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
                            Buttons.buttonAll(context,
                                title: TextApp.signIn,
                                color: Theme.of(context).primaryColor,
                                functinn: () {}),
                            const SizedBox(
                              height: 25,
                            ),
                            MaterialButton(
                                color: Colors.amber,
                                onPressed: () async {
                                  await AuthController()
                                      .register(
                                          name: namelController.text,
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then(
                                          (value) => RouteApp.gotHome(context));
                                }),
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
                    Go.to(context, const ScreenSignin());
                  },
                  child: const Text(
                    TextApp.alreHaAccount,
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
