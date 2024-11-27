import 'package:amubavisual_weddingphoto/app/constant/const_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../../../constant/const_color.dart';
import '../../../constant/constant.dart';
import '../../../data/produk_data/produl_detail_data.dart';
import '../controllers/produk_detail_controller.dart';

class ProdukDetailView extends GetView<ProdukDetailController> {
  final int idProduk;
  const ProdukDetailView({required this.idProduk, super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProdukDetailController(),
      builder: (controller) {
        var detailProduk = controller.detailProdukData.value;
        return controller.isLoadingDetailProduk.value
            ? Scaffold(
                backgroundColor: blackColor,
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      )),
                  backgroundColor: blackColor,
                  elevation: 1,
                  centerTitle: true,
                  title: SizedBox(
                    width: getActualY(y: 200, context: context),
                    child: Image.asset('assets/images/TEAMAMUBA BARU.png'),
                  ),
                ),
                body: loadingShow(context),
              )
            : detailProduk.success == false
                ? Scaffold(
                    backgroundColor: blackColor,
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          )),
                      backgroundColor: blackColor,
                      elevation: 1,
                      centerTitle: true,
                      title: SizedBox(
                        width: getActualY(y: 200, context: context),
                        child: Image.asset('assets/images/TEAMAMUBA BARU.png'),
                      ),
                    ),
                    body: loadingShow(context),
                  )
                : Scaffold(
                    backgroundColor:
                        Color(int.parse('0xff${detailProduk.data!.color}')),
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          )),
                      backgroundColor: blackColor,
                      elevation: 1,
                      centerTitle: true,
                      title: SizedBox(
                        width: getActualY(y: 200, context: context),
                        child: Image.asset('assets/images/TEAMAMUBA BARU.png'),
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: getActualY(y: 200, context: context),
                            child:
                                imageNetwork(detailProduk.data!.thumbMediaUrl!),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                getActualY(y: 20, context: context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailProduk.data!.createdAtFormatted!,
                                  style: textPrimer(context: context)
                                      .copyWith(color: whiteColor),
                                ),
                                getSizedBox(size: 10, context: context),
                                _containerDescription(
                                    context, detailProduk.data!.deskripsi!),
                                getSizedBox(size: 10, context: context),
                                _containerDetailMotor(
                                    context, detailProduk.data!.media!),
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

  Widget _containerDescription(BuildContext context, String dataDesription) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deskripsi Produk',
          style: textPrimer(context: context).copyWith(
            color: whiteColor,
            fontSize: getActualY(y: 16, context: context),
            fontWeight: FontWeight.bold,
          ),
        ),
        getSizedBox(size: 10, context: context),
        Container(
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
            dataDesription,
            textStyle: textPrimer(context: context).copyWith(color: whiteColor),
          ),
        ),
      ],
    );
  }

  Widget _containerDetailMotor(
      BuildContext context, List<Media> dataDetailMotor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DetailMotor',
          style: textPrimer(context: context).copyWith(
            color: whiteColor,
            fontSize: getActualY(y: 16, context: context),
            fontWeight: FontWeight.bold,
          ),
        ),
        getSizedBox(size: 10, context: context),
        SizedBox(
          height: getActualY(y: 220, context: context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataDetailMotor.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var data = dataDetailMotor[index];
              return Column(
                children: [
                  Container(
                    height: getActualY(y: 150, context: context),
                    width: getActualY(y: 150, context: context),
                    margin: EdgeInsets.fromLTRB(
                        getActualY(y: 10, context: context),
                        getActualY(y: 10, context: context),
                        getActualY(y: 10, context: context),
                        0),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getActualY(y: 10, context: context),
                          ),
                          topRight: Radius.circular(
                            getActualY(y: 10, context: context),
                          )),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getActualY(y: 10, context: context),
                          ),
                          topRight: Radius.circular(
                            getActualY(y: 10, context: context),
                          )),
                      child: imageNetwork(data.thumbMediaUrl!),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getActualY(y: 10, context: context),
                      vertical: getActualY(y: 5, context: context),
                    ),
                    width: getActualY(y: 150, context: context),
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.2),
                      boxShadow: [defaultBoxShadow],
                    ),
                    child: Text(
                      removeHtmlTags(data.description!),
                      style: textPrimer(context: context)
                          .copyWith(color: whiteColor),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}
