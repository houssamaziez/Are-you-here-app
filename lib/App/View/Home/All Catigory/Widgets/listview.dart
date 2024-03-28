import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Service/Api/Function/Get/getdata.dart';
import 'package:app/App/util/Size/dimensions.dart';
import 'package:flutter/material.dart';

FutureBuilder<List<Catigorys>> allcatigorys() {
  return FutureBuilder(
    future: GetData.getallCatigorys(),
    builder: (BuildContext context, AsyncSnapshot<List<Catigorys>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return CircularProgressIndicator();
      } else {
        List<Catigorys>? userData = snapshot.data;
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  userData[index].name.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 17,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: SizeApp.widthmobile(context, size: 0.87),
                          color: Colors.grey.shade300,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}
