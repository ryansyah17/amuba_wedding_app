import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/data/myteam_data/artikel_data.dart';
import 'package:amubavisual_weddingphoto/app/data/myteam_data/penghargaan_data.dart';
import 'package:amubavisual_weddingphoto/app/data/myteam_data/riders_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../services/services.dart';
import '../../../constant/base_url.dart';
import '../../../data/myteam_data/motor_data.dart';

class MyTeamPageController extends GetxController {
  var isLoadingArtikel = false.obs;
  var isLoadingRiders = false.obs;
  var isLoadingMotor = false.obs;
  var isLoadingPenghargaan = false.obs;

  var artikelData = DataArtikel().obs;
  var ridersData = DataRiders().obs;
  var motorData = DataMotor().obs;
  var penghargaanData = DataPenghargaan().obs;

  @override
  void onInit() {
    fetchArtikelData(true);
    fetchRidersData(true);
    fetchMotorData(true);
    fetchPenghargaanData(true);
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

  Future<void> fetchArtikelData(bool refresh) async {
    isLoadingArtikel.value = true;
    update();
    var url = '${baseUrl}api/v1/blog';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        artikelData.value = DataArtikel.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Artikel', e);
      print(e);
    } finally {
      isLoadingArtikel.value = false;
      update();
    }
  }

  Future<void> fetchRidersData(bool refresh) async {
    isLoadingRiders.value = true;
    update();
    var url = '${baseUrl}api/v1/rider';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        ridersData.value = DataRiders.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Riders', e);
      print(e);
    } finally {
      isLoadingRiders.value = false;
      update();
    }
  }

  Future<void> fetchMotorData(bool refresh) async {
    isLoadingMotor.value = true;
    update();
    var url = '${baseUrl}api/v1/motor';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        motorData.value = DataMotor.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Motors', e);
      print(e);
    } finally {
      isLoadingMotor.value = false;
      update();
    }
  }

  Future<void> fetchPenghargaanData(bool refresh) async {
    isLoadingPenghargaan.value = true;
    update();
    var url = '${baseUrl}api/v1/tropy';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        penghargaanData.value = DataPenghargaan.fromJson(jsonData);
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      handleException('Penghargaan', e);
      print(e);
    } finally {
      isLoadingPenghargaan.value = false;
      update();
    }
  }
}
