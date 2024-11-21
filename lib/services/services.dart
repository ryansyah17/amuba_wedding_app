import 'dart:convert';
import 'package:amubavisual_weddingphoto/app/constant/const_color.dart';
import 'package:http/http.dart' as http;

import '../app/constant/constant.dart';

void handleErrorResponse(http.Response response) {
  final jsonData = json.decode(response.body);
  showSnackbar(
    title: 'Failed',
    deskripsi: jsonData['message'],
    color: redGagalColor,
  );
}

void handleException(String data, dynamic e) {
  showSnackbar(
    title: 'Failed',
    deskripsi: 'Terjadi Kesalahan $data : $e',
    color: redGagalColor,
  );
}
