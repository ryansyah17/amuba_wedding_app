import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'const_color.dart';
import 'const_text.dart';
import 'custom_loading.dart';

double defaultMargin = 24;
double designHeightPhone = 844;
double designWidthPhone = 390;

double getActualX({
  required double x,
  required BuildContext context,
}) {
  return x / designWidthPhone * MediaQuery.of(context).size.width;
}

double getActualY({
  required double y,
  required BuildContext context,
}) {
  return y / designHeightPhone * MediaQuery.of(context).size.height;
}

double getLineHeight({required double fontSize, required double lineHight}) {
  return lineHight / fontSize;
}

BoxShadow defaultBoxShadow = BoxShadow(
  blurRadius: 5,
  spreadRadius: 1,
  color: greyColor.withOpacity(0.2),
);

SizedBox getSizedBox({
  required double size,
  required BuildContext context,
}) {
  return SizedBox(
    height: getActualY(y: size, context: context),
  );
}

SizedBox getWidthBox({
  required double size,
  required BuildContext context,
}) {
  return SizedBox(
    width: getActualX(x: size, context: context),
  );
}

Text getTextTitle({required BuildContext context, required String title}) {
  return Text(
    title,
    style: textPrimer(context: context).copyWith(
      color: primerColor,
      fontSize: getActualY(y: 18, context: context),
      fontWeight: FontWeight.bold,
    ),
  );
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  await launch(url,
      forceSafariVC: forceWebView, enableJavaScript: enableJavaScript);
}

void showLoading() {
  Get.dialog(
    const Center(
      child: CustomLoading(),
    ),
    barrierDismissible: false,
  );
}

void hideLoading() {
  Get.back();
}

void showSnackbar({
  required String title,
  required String deskripsi,
  required Color color,
}) {
  Get.snackbar(
    title,
    deskripsi,
    colorText: Colors.white,
    backgroundColor: color,
    icon: const Icon(Icons.warning, color: Colors.white),
    snackPosition: SnackPosition.TOP,
  );
}

String formatTanggal(DateTime date) {
  final DateFormat formatter = DateFormat('dd MMMM yyyy', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV2(DateTime date) {
  final DateFormat formatter = DateFormat('dd MMM yyyy', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV3(DateTime date) {
  final DateFormat formatter = DateFormat('dd MMM yyyy, HH:MM WIB', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV4(DateTime date) {
  final DateFormat formatter = DateFormat('EEEE,dd MMMM yyyy', 'id_ID');
  return formatter.format(date);
}

String formatRupiah(int amount) {
  return 'Rp${amount.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
}

CachedNetworkImage imageNetwork(String image) {
  return CachedNetworkImage(
    imageUrl: image,
    fit: BoxFit.cover,
    placeholder: (context, url) => SpinKitCircle(
      color: primerColor,
    ),
  );
}

Widget loadingShow(BuildContext context) {
  return Center(
    child: SpinKitCircle(
      color: primerColor,
    ),
  );
}
