import 'package:app/App/Controller/authController.dart';
import 'package:app/App/Controller/locationController.dart';
import 'package:app/App/Controller/myappcontroller.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/View/Widgets/buttons.dart';
import 'package:app/App/View/Widgets/snackBar.dart';
import 'package:app/App/View/Widgets/textfild.dart';
import 'package:app/App/util/Const/text_app.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:app/App/util/Route/go.dart';
import 'package:app/App/util/theme/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Service/Api/Function/api_operations.dart';

class AddParent extends StatefulWidget {
  const AddParent({super.key});

  @override
  State<AddParent> createState() => _AddParentState();
}

class _AddParentState extends State<AddParent> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController namelController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ApiOperation controller = Provider.of<ApiOperation>(context);
    final controllerMyAPP = Provider.of<MyAppController>(context);
    var controllerlocation = Provider.of<ControllerLocation>(context);

    return Scaffold(
      appBar: AppBar(elevation: 0, leading: Buttons.ButtonBack(context)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
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
                SizeApp.sizedboxh10,
                const Text(
                  TextApp.helloAgainsup,
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
                                controller: namelController,
                                hin: 'Name',
                                title: TextApp.yourName),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                controller: emailController,
                                hin: 'xyz@gmail.com',
                                title: TextApp.emailAddress),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                hin: 'phone',
                                title: TextApp.yourphone),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                controller: passwordController,
                                hin: '**********',
                                obscureText: true,
                                title: TextApp.password),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "City :",
                                  style: StyleApp.style1,
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controllerlocation
                                          .showWilayaMenu(context);
                                    },
                                    child: Consumer<ControllerLocation>(
                                        builder: (context, a, child) {
                                      return SizedBox(
                                          width: double.infinity,
                                          height: 50,
                                          child: Center(
                                              child: Text(
                                            a.selectedWilaya,
                                          )));
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            SizeApp.sizedboxh30,
                            Consumer<ControllerLocation>(
                                builder: (context, a, child) {
                              return Buttons.buttonAll(context,
                                  title: controller.isloadingAuth == false
                                      ? TextApp.registerAccount
                                      : TextApp.loading,
                                  color: Theme.of(context).primaryColor,
                                  functinn: controller.isloadingAuth == false
                                      ? () async {
                                          print(a.selectedWilaya.toString());
                                          if (_formKey.currentState!
                                                  .validate() &&
                                              controllerlocation
                                                      .selectedWilaya !=
                                                  'Select Wilaya') {
                                            controller.change(true);

                                            await AuthController()
                                                .register(
                                                    wilaya: a.selectedWilaya
                                                        .toString(),
                                                    context: context,
                                                    phone: int.parse(
                                                        phoneController.text),
                                                    name: namelController.text,
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text)
                                                .then((value) {
                                              controller.change(false);
                                              Navigator.pop(context);
                                            });
                                            controller.change(false);
                                          } else {
                                            snackBar(context,
                                                message: "Select your Welaya");
                                          }
                                        }
                                      : () {});
                            }),
                            SizeApp.sizedboxh25,
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
