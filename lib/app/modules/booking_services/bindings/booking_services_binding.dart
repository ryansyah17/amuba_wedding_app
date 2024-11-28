import 'package:get/get.dart';

import '../controllers/booking_services_controller.dart';

class BookingServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingServicesController>(
      () => BookingServicesController(),
    );
  }
}
