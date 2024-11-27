import 'package:amubavisual_weddingphoto/app/constant/const_color.dart';
import 'package:amubavisual_weddingphoto/app/constant/const_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../controllers/artikel_detail_controller.dart';

class ArtikelDetailView extends GetView<ArtikelDetailController> {
  final int idArtikel;
  const ArtikelDetailView({required this.idArtikel, super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArtikelDetailController>(
      init: ArtikelDetailController(),
      builder: (controller) {
        var detailArtikel = controller.artikelDetailData.value;
        return Scaffold(
          backgroundColor: blackColor,
          appBar: AppBar(
            backgroundColor: blackColor,
            centerTitle: true,
            elevation: 1,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
              onPressed: () => Get.back(),
            ),
            title: SizedBox(
              width: getActualY(y: 200, context: context),
              child: Image.asset('assets/images/TEAMAMUBA BARU.png'),
            ),
          ),
          body: controller.isLoadingDetailArtikel.value
              ? loadingShow(context)
              : detailArtikel.success == false
                  ? loadingShow(context)
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: getActualY(y: 220, context: context),
                            child: imageNetwork(
                                detailArtikel.data?.mediaUrl ?? ''),
                          ),
                          getSizedBox(size: 10, context: context),
                          Padding(
                            padding: EdgeInsets.all(
                              getActualY(y: 20, context: context),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${detailArtikel.data?.createdAtFormatted ?? ''} Wib',
                                  style: textPrimer(context: context).copyWith(
                                    color: whiteColor,
                                  ),
                                ),
                                _containerDescription(context,
                                    detailArtikel.data?.description ?? ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
        );
      },
    );
  }

  Widget _containerDescription(BuildContext context, String dataArtikel) {
    return Container(
      padding: EdgeInsets.all(
        getActualY(y: 10, context: context),
      ),
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          getActualY(y: 12, context: context),
        ),
        boxShadow: [defaultBoxShadow],
      ),
      child: HtmlWidget(
        dataArtikel,
        textStyle: textPrimer(context: context).copyWith(color: whiteColor),
      ),
    );
  }
}
