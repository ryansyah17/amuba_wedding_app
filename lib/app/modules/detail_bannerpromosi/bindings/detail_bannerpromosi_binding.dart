import 'package:get/get.dart';

import '../controllers/detail_bannerpromosi_controller.dart';

class DetailBannerpromosiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBannerpromosiController>(
      () => DetailBannerpromosiController(),
    );
  }
}
