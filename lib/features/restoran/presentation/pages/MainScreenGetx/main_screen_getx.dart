import 'package:fakenode_restoran_app/features/restoran/domain/entities/restoran.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/api/restoran_api.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/state_management/controller/restoran_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenGetx extends StatelessWidget {
  const MainScreenGetx({Key? key}) : super(key: key);

  _loadData() async {
    //https://www.youtube.com/watch?v=q2vUKcrL5CI
    await Get.find<RestoranController>().fetchRestoranlar();
  }

  @override
  Widget build(BuildContext context) {
    _loadData(); // her build edildiginde data yenilenmesi icin bu kodu koy

    return Scaffold(
      // body: FutureIleYaptigimiz(),
      body: Obx(
        () => ListView.builder(
          itemCount: Get.find<RestoranController>().restoranlar.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(Get.find<RestoranController>()
                    .restoranlar[index]
                    .restoranName),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FutureIleYaptigimiz extends StatelessWidget {
  const FutureIleYaptigimiz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: RestoranApi.getRestoranlar(),
        future: RestoranApi.getRestoranlar(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Beklenmeyen bir hata oluştu..."),
            );
          } else if (snapshot.hasData) {
            List<Restoran> data = snapshot.data as List<Restoran>;
            return ListView.builder(
                // itemCount: 2,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(data[index].restoranName),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
