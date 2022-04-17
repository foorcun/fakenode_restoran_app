import 'package:fakenode_restoran_app/features/restoran/domain/entities/restoran.dart';
import 'package:fakenode_restoran_app/features/restoran/presentation/state_management/service/restoran_service.dart';
import 'package:get/get.dart';

class RestoranController extends GetxController {
  final restoranlar = <Restoran>[].obs;

  @override
  void onInit() {
    fetchRestoranlar();
    // print("restoranlar değer " + restoranlar.value.toString());
    print("RestoranController");
    super.onInit();
  }

  Future<void> fetchRestoranlar() async {
    var d = await RestoranService().getAllRestoran();
    print("ddd " + d.toString());
    restoranlar.assignAll(d);
  }

  Restoran searchDiziById(int id) {
    final restoran = restoranlar.where((element) {
      return element.id == id;
      // return p0;
    });
    return restoran.first;
  }

  Future<void> addRestoran(Restoran r) async {
    await RestoranService().addRestoran(r);
  }

  Future<void> deleteRestoran(Restoran r) async {
    await RestoranService().deleteRestoran(r);
  }
}
