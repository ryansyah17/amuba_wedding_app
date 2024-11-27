import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/constant/base_url.dart';
import 'package:amubavisual_weddingphoto/app/data/home_data/banner_promosi_data.dart';
import 'package:amubavisual_weddingphoto/app/data/home_data/event_data.dart';
import 'package:amubavisual_weddingphoto/app/data/other_data/data_contact_person.dart';
import 'package:amubavisual_weddingphoto/app/data/other_data/kategori_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../services/services.dart';
import '../../../data/home_data/banner_slide_data.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  var itemCount = 100.obs; // Observable item count
  var isLoading = false.obs;

  //data kategori
  RxList<String> kategori = RxList<String>(['']);
  RxString selectedTipe = "".obs;
  var selectedid = 0.obs;

  //loading
  var isLoadingBannerSlideData = false.obs;
  var isLoadingBannerPromosiData = false.obs;
  var isLoadingKategoriData = false.obs;
  var isLoadingEventData = false.obs;
  var isLoadingWhatsAppData = false.obs;
  var currentPage = 1;

  //entity
  var imageSlideData = DataImageSlider().obs;
  var promosiSlideData = DataBannerPromosi().obs;
  var kategoriData = DataKategori().obs;
  var eventData = DataEvent().obs;
  var whatsappData = DataWhatsApp().obs;

  @override
  void onInit() {
    fetchEventData(true, null);
    fetchKategoriListData(true);
    fetchBannerData(true);
    fetchBannerPromosiData(true);
    fetchWhatsAppData(true);
    super.onInit();
  }

  //fetch banner image slider
  Future<void> fetchBannerData(bool refresh) async {
    isLoadingBannerSlideData.value = true;
    update();
    var url = '${baseUrl}api/v1/slider?kategori=image_slider';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        imageSlideData.value = DataImageSlider.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Banner', e);
      print(e);
    } finally {
      isLoadingBannerSlideData.value = false;
      update();
    }
  }

  //fetch banner promosi
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

  //fetch kategori data
  Future<void> fetchKategoriListData(bool refresh) async {
    isLoadingKategoriData.value = true;
    update();
    var url = '${baseUrl}api/v1/category';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        kategoriData.value = DataKategori.fromJson(jsonData);
        // Memasukkan hasil ke dalam value dropdown
        kategori.value = ['All'] +
            kategoriData.value.data!.map((e) => e.name ?? '').toList();
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Kategori', e);
      print(e);
    } finally {
      isLoadingKategoriData.value = false;
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

  //fetch event data
  Future<void> fetchEventData(bool refresh, int? selectedId) async {
    isLoadingEventData.value = true;
    update();

    var url =
        '${baseUrl}api/v1/event${selectedId != null && selectedId != 0 ? '?category=$selectedId' : ''}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        eventData.value = DataEvent.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Event', e);
      print(e);
    } finally {
      isLoadingEventData.value = false;
      update();
    }
  }
}
