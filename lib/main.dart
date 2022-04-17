import 'package:fakenode_restoran_app/features/restoran/presentation/pages/MainScreenGetx/main_screen_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//start the server
//start C:\API
//json-server --watch dizi_ayraci.json

// flutter run -d chrome --web-hostname localhost --web-port 5000 --no-sound-null-safety

void main() {
  // AllDiziBindings().dependencies();
  runApp(const HttpApp());
}

class HttpApp extends StatelessWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // // initialBinding: AllDiziBindings(),
      // // home: MainScreen(),
      // // home: SezonScreen(),
      // home: MainScreenGetx(),

      debugShowCheckedModeBanner: false,
      title: 'FakeNode Restoran App',
      // initialRoute: homePageBringer(),
      initialRoute: "/main_screen_getx",

      getPages: [
        GetPage(name: "/main_screen_getx", page: () => MainScreenGetx()),
      ],
    );
  }
}
