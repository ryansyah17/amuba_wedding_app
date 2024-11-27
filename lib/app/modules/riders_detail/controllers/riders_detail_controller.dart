import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/data/arguments/detail_riders_arguments.dart';
import 'package:amubavisual_weddingphoto/app/data/myteam_data/riders_detail_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../services/services.dart';
import '../../../constant/base_url.dart';

class RidersDetailController extends GetxController {
  var isLoadingDetailRiders = false.obs;

  var ridersDetailData = DataDetailRiders().obs;

  DetailRidersArguments args = Get.arguments;

  @override
  void onInit() {
    fetchRidersDetailData(true);
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

  Future<void> fetchRidersDetailData(bool refresh) async {
    isLoadingDetailRiders.value = true;
    update();
    var url = '${baseUrl}api/v1/rider/detail/${args.id}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        ridersDetailData.value = DataDetailRiders.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Detail Riders', e);
      print(e);
    } finally {
      isLoadingDetailRiders.value = false;
      update();
    }
  }
}
