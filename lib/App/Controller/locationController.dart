import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/util/List/listof_wilayat.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';

class ControllerLocation extends ChangeNotifier {
  String selectedWilaya = 'Select Wilaya';

  void showWilayaMenu(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: SizeApp.heightmobile(context, size: 0.5),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: wilayasList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Center(
                        child: Text(
                      wilayasList[index],
                      textAlign: TextAlign.start,
                    )),
                    onTap: () {
                      userwilaya.write('wilaya', wilayasList[index]);
                      selectedWilaya = wilayasList[index];
                      notifyListeners();
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void showlavelMenu(context, List<Lavle> lisLavel) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: SizeApp.heightmobile(context, size: 0.5),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: lisLavel.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Center(
                        child: Text(
                      lisLavel[index].name.toString(),
                      textAlign: TextAlign.start,
                    )),
                    onTap: () {
                      userwilaya.write(
                          'lavel', lisLavel[index].name.toString());
                      selectedWilaya = lisLavel[index].name.toString();
                      notifyListeners();
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
