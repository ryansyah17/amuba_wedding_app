import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/data/arguments/detail_motor_arguments.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../services/services.dart';
import '../../../constant/base_url.dart';
import '../../../data/myteam_data/motor_detail_data.dart';

class MotorDetailController extends GetxController {
  var isLoadingMotorDetailData = false.obs;

  var motorDetailData = DataDetailMotor().obs;

  DetailMotorArguments args = Get.arguments;
  @override
  void onInit() {
    fetctMotorDetailData(true);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetctMotorDetailData(bool refresh) async {
    isLoadingMotorDetailData.value = true;
    update();
    var url = '${baseUrl}api/v1/motor/detail/${args.id}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        motorDetailData.value = DataDetailMotor.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Detail Motor', e);
      print(e);
    } finally {
      isLoadingMotorDetailData.value = false;
      update();
    }
  }
}
