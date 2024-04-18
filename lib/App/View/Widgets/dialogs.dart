import 'package:app/App/Service/Api/Function/Delete/delete.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteConfirmationDialog(BuildContext context, route,
    {required title}) async {
  // The showDialog function returns a Future that completes to the value passed to Navigator.pop
  return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text(title.toString())),
            content: Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('هل انت متأكد من تأكيد العملية'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('إلغاء'),
                onPressed: () {
                  // Dismiss the dialog and return false
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('تأكيد'),
                onPressed: () async {
                  ApiDelete.deleteData(route)
                      .then((value) => Navigator.of(context).pop(true));
                },
              ),
            ],
          );
        },
      ) ??
      false; // Return false if the dialog is dismissed by other means
}
