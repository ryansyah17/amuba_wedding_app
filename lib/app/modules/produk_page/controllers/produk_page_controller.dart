import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/data/produk_data/produk_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../services/services.dart';
import '../../../constant/base_url.dart';
import '../../../data/other_data/data_contact_person.dart';

class ProdukPageController extends GetxController {
  var isLoadingproduk = false.obs;
  var isLoadingWhatsAppData = false.obs;

  var produkData = DataProduk().obs;
  var whatsappData = DataWhatsApp().obs;

  @override
  void onInit() {
    fetchWhatsAppData(true);
    fetchProdukData(true);
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

  Future<void> fetchProdukData(bool refresh) async {
    isLoadingproduk.value = true;
    update();
    var url = '${baseUrl}api/v1/product';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        produkData.value = DataProduk.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Produk', e);
      print(e);
    } finally {
      isLoadingproduk.value = false;
      update();
    }
  }

  Future<void> fetchWhatsAppData(bool refresh) async {
    isLoadingWhatsAppData.value = true;
    update();
    var url = '${baseUrl}api/v1/utils/get-whatsapp-number';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        whatsappData.value = DataWhatsApp.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('WhatsApp', e);
      print(e);
    } finally {
      isLoadingWhatsAppData.value = false;
      update();
    }
  }
}
