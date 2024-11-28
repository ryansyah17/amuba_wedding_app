import 'dart:convert';

import 'package:amubavisual_weddingphoto/app/constant/base_url.dart';
import 'package:amubavisual_weddingphoto/app/constant/const_color.dart';
import 'package:amubavisual_weddingphoto/app/modules/navbar/views/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constant/constant.dart';

class BookingServicesController extends GetxController {
  late TextEditingController namaController;
  late TextEditingController keteranganController;
  late TextEditingController nomorHpController;

  @override
  void onInit() {
    namaController = TextEditingController();
    keteranganController = TextEditingController();
    nomorHpController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namaController.dispose();
    keteranganController.dispose();
    nomorHpController.dispose();
    super.onClose();
  }

  RxList<String> jam = RxList<String>([
    "09.00",
    "10.00",
    "11.00",
    "12.00",
    "13.00",
    "14.00",
    "15.00",
    "16.00",
    "17.00",
    "18.00"
  ]);

  Rx<DateTime?> selectDate =
      Rx<DateTime?>(DateTime.now().toUtc().add(const Duration(hours: 7)));

  // Add a variable to store the selected time
  RxString selectedTime = "".obs;

  void selectDatePengeluaran(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectDate.value = picked;
    }
  }

  Future<void> postBookingServices(
    String tanggal,
    String jam,
    String nama,
    String nohp,
    String keterangan,
  ) async {
    showLoading();

    final url = '${baseUrl}api/v1/booking';
    final request =
        _createMultipartRequest(url, tanggal, jam, nama, nohp, keterangan);

    try {
      final response = await request.send();
      await _handleResponse(response);
    } catch (e) {
      _showErrorSnackbar('Terjadi kesalahan: $e');
    }
  }

  http.MultipartRequest _createMultipartRequest(String url, String tanggal,
      String jam, String nama, String nohp, String keterangan) {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(_buildHeaders());
    request.fields['tanggal'] = tanggal;
    request.fields['jam'] = jam;
    request.fields['nama'] = nama;
    request.fields['no_hp'] = nohp;
    request.fields['keterangan'] = keterangan;
    return request;
  }

  Map<String, String> _buildHeaders() {
    return {
      'Content-Type': 'multipart/form-data',
    };
  }

  Future<void> _handleResponse(http.StreamedResponse response) async {
    final responseBody = await response.stream.bytesToString();
    final responseData = json.decode(responseBody);

    if (response.statusCode == 200) {
      _showSuccessSnackbar(responseData['message']);
      Get.offAll(
        MainPageView(
          initialPage: 1,
        ),
      );
    } else {
      hideLoading();
      print(responseData['message']);
      _showErrorSnackbar('${responseData['message']}');
    }
  }

  void _showSuccessSnackbar(String message) {
    showSnackbar(
      title: 'Berhasil',
      deskripsi: message,
      color: Colors.green,
    );
  }

  void _showErrorSnackbar(String message) {
    showSnackbar(
      title: 'Failed',
      deskripsi: message,
      color: redGagalColor,
    );
  }
}
