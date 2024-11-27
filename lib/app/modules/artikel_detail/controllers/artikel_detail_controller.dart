import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/data/arguments/detail_artikel_arguments.dart';
import 'package:amubavisual_weddingphoto/app/data/myteam_data/artikel_detail_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../services/services.dart';
import '../../../constant/base_url.dart';

class ArtikelDetailController extends GetxController {
  var isLoadingDetailArtikel = false.obs;

  var artikelDetailData = DataDetailArtikel().obs;

  DetailArtikelArguments args = Get.arguments;

  final count = 0.obs;
  @override
  void onInit() {
    fetchArtikelDetailData(true);
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

  Future<void> fetchArtikelDetailData(bool refresh) async {
    isLoadingDetailArtikel.value = true;
    update();
    var url = '${baseUrl}api/v1/blog/detail/${args.id}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        artikelDetailData.value = DataDetailArtikel.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Detail Artikel', e);
      print(e);
    } finally {
      isLoadingDetailArtikel.value = false;
      update();
    }
  }
}
