import 'package:get/get.dart';

import '../controllers/motor_detail_controller.dart';

class MotorDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MotorDetailController>(
      () => MotorDetailController(),
    );
  }
}
