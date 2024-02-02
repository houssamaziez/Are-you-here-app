import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/theme/Style/styles.dart';

class Textfildapp {
  static Column myTextfilde(
      {required String title,
      required String hin,
      TextInputType keyboardType = TextInputType.emailAddress,
      bool obscureText = false,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StyleApp.style1,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 55,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            scribbleEnabled: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${title}';
              }
              return null;
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 246, 246, 246), // Set background color to grey
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0),
                  borderRadius: BorderRadius.circular(17.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: hin),
          ),
        )
      ],
    );
  }
}
