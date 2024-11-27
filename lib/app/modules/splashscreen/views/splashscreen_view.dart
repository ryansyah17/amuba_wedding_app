import 'package:amubavisual_weddingphoto/app/constant/const_color.dart';
import 'package:amubavisual_weddingphoto/app/constant/constant.dart';
import 'package:amubavisual_weddingphoto/app/modules/navbar/views/main_page_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(MainPageView(initialPage: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(getActualY(y: 60, context: context)),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: blueColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getSizedBox(size: 20, context: context),
            Column(
              children: [
                Image.asset(
                  'assets/images/TEAMAMUBA BARU.png',
                ),
                getSizedBox(size: 20, context: context),
                loadingShow(
                  context,
                )
              ],
            ),
            getSizedBox(size: 20, context: context),
            // Container(
            //   decoration: BoxDecoration(
            //       color: whiteColor.withOpacity(0.4),
            //       boxShadow: [defaultBoxShadow],
            //       borderRadius: BorderRadius.circular(
            //           getActualY(y: 12, context: context))),
            //   child: Column(
            //     children: [
            //       Text(
            //         'Part Of Team Amuba',
            //         style: textPrimer(context: context).copyWith(
            //           color: blackColor,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SizedBox(
            //             height: getActualY(y: 50, context: context),
            //             child: Image.asset('assets/icons/neyor.png'),
            //           ),
            //           SizedBox(
            //             height: getActualY(y: 50, context: context),
            //             child: Image.asset('assets/icons/babeh.png'),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SizedBox(
            //             height: getActualY(y: 40, context: context),
            //             child: Image.asset('assets/icons/cmb.png'),
            //           ),
            //           SizedBox(
            //             height: getActualY(y: 40, context: context),
            //             child: Image.asset('assets/icons/andrian.png'),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
