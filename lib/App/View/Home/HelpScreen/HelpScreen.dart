import 'package:app/App/Service/ImageCach/imagecach.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../Service/call/functioncall.dart';
import '../../../util/Size/dimensions.dart';
import '../../Auth/Sign in/screensignin.dart';
import '../Screens/Notification/Send Notification/screenSendNotification.dart';
import '../import_home.dart';

class ScreenMinu extends StatelessWidget {
  ScreenMinu({super.key});
  @override
  Widget build(BuildContext context) {
    List<Andalos> andalosdata = [
      Andalos(
          name: "ارسل لنا اشعار",
          iocn: Icons.notification_add,
          function: () {
            Go.to(
                context,
                const SendNotification(
                  id_user: 5,
                ));
          }),
      Andalos(
          name: "اتصل بنا",
          iocn: Icons.call,
          function: () {
            makePhoneCall('920020282'.toString());
          }),
      Andalos(
          name: "زر موقعنا",
          iocn: Icons.web_outlined,
          function: () {
            launchURL('https://alandalus.edu.sa/about_us');
          }),
      Andalos(
          name: "موقعنا الجغرافي",
          iocn: Icons.pin_drop_rounded,
          function: () {
            launchURL(
                '''https://www.google.com/maps/place/21%C2%B036'05.8%22N+39%C2%B008'01.2%22E/@21.6022557,39.1309887,16.08z/data=!4m4!3m3!8m2!3d21.601596!4d39.1336651?entry=ttu''');
          }),
      Andalos(
          name: "تسجيل الخروج",
          iocn: Icons.login_sharp,
          function: () {
            userid
                .write('iduser', null)
                .then((value) => Go.push(const ScreenSignin()));
          })
    ];

    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Container(
              child: CachedNetworkImage(
                imageUrl: "https://alandalus.edu.sa/front/img/ro2ya.png",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.brown,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              width: double.infinity,
              height: SizeApp.heightmobile(context, size: 0.3),
            ),
          ),
          SizeApp.sizedboxh20,
          Row(
            children: [
              Spacer(),
              Text(
                " :مساعدة ",
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: andalosdata.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    andalosdata[index].function();
                  },
                  child: Card(
                    child: ListTile(
                      leading: Icon(andalosdata[index].iocn),
                      title: Text(andalosdata[index].name),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Andalos {
  final String name;
  final IconData iocn;
  final Function function;

  Andalos({required this.name, required this.iocn, required this.function});
}
