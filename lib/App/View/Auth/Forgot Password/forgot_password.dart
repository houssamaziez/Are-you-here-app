import 'package:app/App/Controller/Auth/authController.dart';
import 'package:app/App/Service/Api/api_operations.dart';
import 'package:app/App/View/Auth/Register%20Account/screenRegister.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/View/Widgets/snackBar.dart';
import 'package:app/App/View/Widgets/textfild.dart';
import 'package:app/App/util/Const/text_app.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:app/App/util/theme/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenConfermpassword extends StatefulWidget {
  final String email;
  const ScreenConfermpassword({super.key, required this.email});
  @override
  State<ScreenConfermpassword> createState() => _ScreenSigninState();
}

class _ScreenSigninState extends State<ScreenConfermpassword> {
  final TextEditingController passwordconfermController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    passwordconfermController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<ApiOperation>(context);

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
                  TextApp.findYaccount,
                  style: StyleApp.title,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  TextApp.enteremail,
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
                        key: _formKey,
                        child: Column(
                          children: [
                            Textfildapp.myTextfilde(
                                controller: passwordconfermController,
                                keyboardType: TextInputType.name,
                                hin: '********',
                                obscureText: true,
                                title: TextApp.password),
                            const SizedBox(
                              height: 20,
                            ),
                            Textfildapp.myTextfilde(
                                obscureText: true,
                                controller: passwordController,
                                keyboardType: TextInputType.name,
                                hin: '********',
                                title: TextApp.passwordconfi),
                            const SizedBox(
                              height: 20,
                            ),
                            Buttons.buttonAll(context,
                                title: myData.isloadingAuth == false
                                    ? TextApp.Search
                                    : TextApp.loading,
                                color: Theme.of(context).primaryColor,
                                functinn: myData.isloadingAuth == false
                                    ? () async {
                                        if (_formKey.currentState!.validate()) {
                                          if (passwordconfermController.text ==
                                              passwordController.text) {
                                            myData.change(true);
                                            await AuthController()
                                                .updatepassword(
                                                  password:
                                                      passwordconfermController
                                                          .text,
                                                  context: context,
                                                  email: widget.email,
                                                )
                                                .then((value) =>
                                                    myData.change(false));
                                          } else {
                                            snackBar(
                                              context,
                                              message:
                                                  TextApp.passwordsnotmatch,
                                            );
                                          }
                                        }
                                      }
                                    : () {}),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
