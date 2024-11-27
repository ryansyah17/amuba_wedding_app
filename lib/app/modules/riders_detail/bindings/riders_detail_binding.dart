import 'package:get/get.dart';

import '../controllers/riders_detail_controller.dart';

class RidersDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RidersDetailController>(
      () => RidersDetailController(),
    );
  }
}
