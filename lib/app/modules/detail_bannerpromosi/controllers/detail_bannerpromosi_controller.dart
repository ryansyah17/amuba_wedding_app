import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/data/arguments/detail_banner_promosi.dart';
import 'package:amubavisual_weddingphoto/app/data/home_data/detail_banner_promosi.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../../services/services.dart';
import '../../../constant/base_url.dart';

class DetailBannerpromosiController extends GetxController {
  var current = 0.obs;
  var isLoadingDetailBannerPromosi = false.obs;

  var dataDetailBannerPromosi = DataDetailBannerPromosi().obs;

  DetailBannerPromosiArguments args = Get.arguments;

  @override
  void onInit() {
    fetchEventDetailData(true);
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

  Future<void> fetchEventDetailData(bool refresh) async {
    isLoadingDetailBannerPromosi.value = true;
    update();

    var url = '${baseUrl}api/v1/slider/detail/${args.id}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        dataDetailBannerPromosi.value =
            DataDetailBannerPromosi.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Detail Banner', e);
      print(e);
    } finally {
      isLoadingDetailBannerPromosi.value = false;
      update();
    }
  }
}
