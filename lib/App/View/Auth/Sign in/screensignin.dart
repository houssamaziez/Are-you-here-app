import 'package:app/App/Controller/authController.dart';
import 'package:app/App/Controller/myappcontroller.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import '../../../Service/Api/Function/Put/user.dart';
import '../../../Service/Api/Function/api_operations.dart';
import 'package:app/App/View/Auth/Forgot%20Password/screen_searshEmai.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/View/Widgets/textfild.dart';
import 'package:app/App/util/Const/text_app.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:app/App/util/theme/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Welcome/inistateWelcome.dart';

class ScreenSignin extends StatefulWidget {
  const ScreenSignin({super.key});

  @override
  State<ScreenSignin> createState() => _ScreenSigninState();
}

class _ScreenSigninState extends State<ScreenSignin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<ApiOperation>(context);
    final controllerMyAPP = Provider.of<MyAppController>(context);

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
                SizeApp.sizedboxh10,
                const Text(
                  TextApp.helloAgainsup,
                  style: StyleApp.suptitle,
                  textAlign: TextAlign.center,
                ),
                SizeApp.sizedboxh10,
                Spacer(),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Textfildapp.myTextfilde(
                                controller: emailController,
                                hin: 'xyz@gmail.com',
                                title: TextApp.emailAddress),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                controller: passwordController,
                                hin: '**********',
                                obscureText: true,
                                title: TextApp.password),
                            SizeApp.sizedboxh30,
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Buttons.buttonAll(context,
                                  title: myData.isloadingAuth == false
                                      ? TextApp.signIn
                                      : TextApp.loading,
                                  color: Theme.of(context).primaryColor,
                                  functinn: myData.isloadingAuth == false
                                      ? () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            myData.change(true);
                                            await AuthController()
                                                .login(
                                                    context: context,
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text)
                                                .then((value) {
                                              myData.change(false);
                                              ApiOperation.getuserData(
                                                int.parse(
                                                    userid.read('iduser')),
                                              ).then((value) => controllerMyAPP
                                                  .updateData(value));

                                              myData.change(false);
                                            });
                                            myData.change(false);
                                          }
                                        }
                                      : () {}),
                            ),
                          ],
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Go.to(context, const ScreenSendemail());
                    },
                    child: const Text(
                      TextApp.forgotpassword,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                // TextButton(
                //   onPressed: () {
                //     Go.to(context, const ScreenRegister());
                //   },
                //   child: const Text(
                //     TextApp.newUsCreateaccount,
                //     style: TextStyle(),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
