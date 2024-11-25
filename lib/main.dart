import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _requestPermissions();
  await initializeDateFormatting('id_ID', null).then(
    (_) => {
      runApp(
        GetMaterialApp(
          title: "Team Amuba",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        ),
      )
    },
  );
}

Future<void> _requestPermissions() async {
  await Permission.storage.request();
}
