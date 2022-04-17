import 'package:fakenode_restoran_app/features/restoran/data/models/restoran_model.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/state_management/controller/restoran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRestoranView extends StatelessWidget {
  AddRestoranView({Key? key}) : super(key: key);
  final _restoranTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            RestoranNameContainer(
                restoranTextController: _restoranTextController),
            AddElevatedButton(restoranTextController: _restoranTextController),
          ],
        ),
      ),
    );
  }
}

class RestoranNameContainer extends StatelessWidget {
  const RestoranNameContainer({
    Key? key,
    required TextEditingController restoranTextController,
  })  : _restoranTextController = restoranTextController,
        super(key: key);

  final TextEditingController _restoranTextController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: _restoranTextController,
      ),
      padding: EdgeInsets.all(32),
    );
  }
}

class AddElevatedButton extends StatelessWidget {
  const AddElevatedButton({
    Key? key,
    required TextEditingController restoranTextController,
  })  : _restoranTextController = restoranTextController,
        super(key: key);

  final TextEditingController _restoranTextController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // print(_restoranTextController.text);
        // var uri = Uri.parse("http://localhost:3000/diziler");
        // var response = await http.post(uri, body: {
        //   "diziName": _restoranTextController.text,
        // });
        // print(response.body);

        Get.find<RestoranController>().addRestoran(
            RestoranModel(restoranName: _restoranTextController.text));

        // Get.back(); // bunu kullandigimiz zaman rebuild etmiyor main_screen_getx.dart i. dolayisiyla eklenen data gorulmuyor.
        Get.toNamed("/main_screen_getx");
      },
      child: Text("Yeni Restoran Yarat"),
    );
  }
}
