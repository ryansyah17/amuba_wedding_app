import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/constant/const_color.dart';
import 'package:amubavisual_weddingphoto/app/data/arguments/detail_event_arguments.dart';
import 'package:amubavisual_weddingphoto/app/data/home_data/event_detail_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

import '../../../../services/services.dart';
import '../../../constant/base_url.dart';
import '../../../data/home_data/banner_promosi_data.dart';

class DetailEventController extends GetxController {
  var isLoadingDetailEvent = false.obs;
  var isLoadingBannerPromosiData = false.obs;

  var detailEventData = DataDetailEvent().obs;
  var promosiSlideData = DataBannerPromosi().obs;

  //args
  DetailEventArguments args = Get.arguments;

  var currentPage = 1;
  var currentIndex = 0.obs;
  void setCurrentIndex(int index) {
    currentIndex.value = index; // Update the current index
  }

  @override
  void onInit() {
    fetchBannerPromosiData(true);
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

  Future<void> fetchEventDetailData(bool refresh, {int page = 1}) async {
    if (refresh) {
      currentPage = 1; // Reset to the first page when refreshing
    }
    isLoadingDetailEvent.value = true;
    update();

    var url =
        '${baseUrl}api/v1/event/detail/${args.id}?page_size=20&page=$page';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (refresh) {
          detailEventData.value = DataDetailEvent.fromJson(jsonData);
        } else {
          var newData = DataDetailEvent.fromJson(jsonData);
          detailEventData.value.media?.results
              .addAll(newData.media?.results ?? []);
        }
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Detail Event', e);
      print(e);
    } finally {
      isLoadingDetailEvent.value = false;
      update();
    }
  }

  Future<void> fetchBannerPromosiData(bool refresh) async {
    isLoadingBannerPromosiData.value = true;
    update();
    var url = '${baseUrl}api/v1/slider?kategori=banner_promosi';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        promosiSlideData.value = DataBannerPromosi.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Promosi', e);
      print(e);
    } finally {
      isLoadingBannerPromosiData.value = false;
      update();
    }
  }

  simpanGambarDariJaringan(String imageLink, String nama) async {
    var url = imageLink;

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final result = await ImageGallerySaverPlus.saveImage(
          Uint8List.fromList(response.bodyBytes),
          quality: 60,
          name: nama,
          isReturnImagePathOfIOS: true,
        );
        Get.snackbar(
          'Success',
          'Berhasil Download Image',
          colorText: blackColor,
          backgroundColor: primerColor,
          icon: Icon(
            Icons.check,
            color: blackColor,
          ),
        );
        print(result);
      } else {
        print("Gagal menyimpan gambar. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Terjadi kesalahan: $e");
    }
  }
}
