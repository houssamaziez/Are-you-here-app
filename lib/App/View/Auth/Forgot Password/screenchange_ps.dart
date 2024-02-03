import 'package:app/App/Controller/authController.dart';
import 'package:app/App/Model/user.dart';
import '../../../Service/Api/Function/api_operations.dart';
import 'package:app/App/View/Auth/Forgot%20Password/forgot_password.dart';
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

class ScreenChangePassword extends StatefulWidget {
  final String code, email;
  const ScreenChangePassword(
      {super.key, required this.code, required this.email});
  @override
  State<ScreenChangePassword> createState() => _ScreenSigninState();
}

class _ScreenSigninState extends State<ScreenChangePassword> {
  final TextEditingController codecontroller = TextEditingController();

  @override
  void dispose() {
    codecontroller.dispose();
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
                  TextApp.securitycode,
                  style: StyleApp.title,
                ),
                SizeApp.sizedboxh10,
                const Text(
                  TextApp.pleasecheckemail,
                  style: StyleApp.suptitle,
                  textAlign: TextAlign.center,
                ),
                SizeApp.sizedboxh10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Textfildapp.myTextfilde(
                                controller: codecontroller,
                                keyboardType: TextInputType.number,
                                hin: TextApp.entercode,
                                title: TextApp.code),
                            SizeApp.sizedboxh20,

                            Buttons.buttonAll(context,
                                title: myData.isloadingAuth == false
                                    ? TextApp.next
                                    : TextApp.loading,
                                color: Theme.of(context).primaryColor,
                                functinn: myData.isloadingAuth == false
                                    ? () async {
                                        if (_formKey.currentState!.validate()) {
                                          if (widget.code ==
                                              codecontroller.text) {
                                            Go.to(
                                                context,
                                                ScreenConfermpassword(
                                                  email: widget.email,
                                                ));
                                          } else {
                                            snackBar(context,
                                                message: TextApp.errcode);
                                          }
                                        }
                                      }
                                    : () {}),
                            SizeApp.sizedboxh25,

                            // Buttons.buttonAll(context,
                            //     title: TextApp.signInwithGoogle,
                            //     isgoogle: true,
                            //     color: const Color.fromARGB(255, 235, 235, 235),
                            //     functinn: () {}),
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
