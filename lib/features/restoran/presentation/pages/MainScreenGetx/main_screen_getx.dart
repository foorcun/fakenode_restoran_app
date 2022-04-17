import 'package:fakenode_restoran_app/features/restoran/domain/entities/restoran.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/api/restoran_api.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/state_management/controller/restoran_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MainScreenGetx extends StatelessWidget {
  MainScreenGetx({Key? key}) : super(key: key);

  final loadydadada = () async {
    await Get.find<RestoranController>().fetchRestoranlar();
  };

  _loadData() async {
    //https://www.youtube.com/watch?v=q2vUKcrL5CI
    await Get.find<RestoranController>().fetchRestoranlar();
  }

  @override
  Widget build(BuildContext context) {
    _loadData(); // her build edildiginde data yenilenmesi icin bu kodu koy

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _floatingPrint,
        tooltip: 'Add new Restoran',
        child: const Icon(Icons.add),
      ),

      // body: FutureIleYaptigimiz(),
      body: Obx(
        () => ListView.builder(
          itemCount: Get.find<RestoranController>().restoranlar.length,
          itemBuilder: (context, index) {
            // return Card(
            //   child: ListTile(
            //     title: Text(Get.find<RestoranController>()
            //         .restoranlar[index]
            //         .restoranName!),
            //   ),
            // );
            return CustomSlidable(
              childWidget: Card(
                child: ListTile(
                  title: Text(Get.find<RestoranController>()
                      .restoranlar[index]
                      .restoranName!),
                ),
              ),
              index: index,
              loadData: loadydadada,
            );
          },
        ),
      ),
    );
  }

  void _floatingPrint() {
    Get.toNamed("/AddRestoranView");
  }
}

// class FutureIleYaptigimiz extends StatelessWidget {
//   const FutureIleYaptigimiz({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         // future: RestoranApi.getRestoranlar(),
//         future: RestoranApi.getRestoranlar(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Beklenmeyen bir hata oluştu..."),
//             );
//           } else if (snapshot.hasData) {
//             List<Restoran> data = snapshot.data as List<Restoran>;
//             return ListView.builder(
//                 // itemCount: 2,
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                       title: Text(data[index].restoranName),
//                     ),
//                   );
//                 });
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         });
//   }
// }

class CustomSlidable extends StatelessWidget {
  CustomSlidable({
    Key? key,
    required Widget childWidget,
    required int index,
    required Function loadData,
  })  : _childWidget = childWidget,
        _index = index,
        _loadData = loadData,
        super(key: key);
  final Widget _childWidget;
  final int _index;
  final Function _loadData;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: _childWidget,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (BuildContext context) {
              print("basıldım...");

              showDialog(
                  context: context,
                  builder: (_) {
                    return CupertinoAlertDialog(
                      content: Text(Get.find<RestoranController>()
                              .restoranlar[_index]
                              .restoranName! +
                          " silmek ister misiniz?"),
                      actions: [
                        CupertinoDialogAction(
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pop(context);
                              Get.back();
                            },
                            child: Text("İptal"),
                          ),
                        ),
                        CupertinoDialogAction(
                          child: ElevatedButton(
                            child: Text("Evet"),
                            onPressed: () async {
                              // await cDizi.delete();
                              print(Get.find<RestoranController>()
                                  .restoranlar[_index]
                                  .restoranName);

                              //https://www.youtube.com/watch?v=jymr1hEvfkM   //28:00 civarları
                              var uri = Uri.parse(
                                  "http://localhost:3000/restoranlar/${Get.find<RestoranController>().restoranlar[_index].id}");
                              // var response =
                              await http
                                  .delete(uri)
                                  .then((value) => print(value.body));
                              // print(response.body);
                              _loadData();

                              Get.back();
                            },
                          ),
                        )
                      ],
                    );
                  });
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            label: 'Delete',
          ),
        ],
      ),
    );
  }
}
