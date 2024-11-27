import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/data/arguments/detail_produk_arguments.dart';
import 'package:amubavisual_weddingphoto/app/data/produk_data/produl_detail_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../services/services.dart';
import '../../../constant/base_url.dart';

class ProdukDetailController extends GetxController {
  var isLoadingDetailProduk = false.obs;

  var detailProdukData = DataDetailProduk().obs;

  DetailProdukArguments args = Get.arguments;
  @override
  void onInit() {
    fetchProdukDetailData(true);
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

  Future<void> fetchProdukDetailData(bool refresh) async {
    isLoadingDetailProduk.value = true;
    update();
    var url = '${baseUrl}api/v1/product/detail/${args.id}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        detailProdukData.value = DataDetailProduk.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Detail Produk', e);
      print(e);
    } finally {
      isLoadingDetailProduk.value = false;
      update();
    }
  }
}
