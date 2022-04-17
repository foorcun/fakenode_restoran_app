import 'package:fakenode_restoran_app/features/restoran/presentation/state_management/controller/restoran_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AllRestoranBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RestoranController>(() => RestoranController());
    // Get.lazyPut<SezonController>(() => SezonController());
  }
}
