import 'package:get/get.dart';

import '../controllers/produk_page_controller.dart';

class ProdukPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdukPageController>(
      () => ProdukPageController(),
    );
  }
}
