import 'package:fakenode_restoran_app/features/restoran/presentation/pages/AddRestoranView/add_restoran_view.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/pages/MainScreenGetx/main_screen_getx.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/state_management/all_restoran_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//start the server
//start C:\API
//json-server --watch dizi_ayraci.json

// flutter run -d chrome --web-hostname localhost --web-port 5000 --no-sound-null-safety

void main() {
  AllRestoranBindings()
      .dependencies(); // burayi getx kullanimi icin uncomment et
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FakeNode Restoran App',
      // initialRoute: homePageBringer(),
      initialRoute: "/main_screen_getx",

      getPages: [
        GetPage(name: "/main_screen_getx", page: () => MainScreenGetx()),
        GetPage(name: "/AddRestoranView", page: () => AddRestoranView()),
      ],
    );
  }
}
