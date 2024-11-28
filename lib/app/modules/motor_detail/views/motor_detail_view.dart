import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../../../constant/const_color.dart';
import '../../../constant/const_text.dart';
import '../../../constant/constant.dart';
import '../../../data/myteam_data/motor_detail_data.dart';
import '../controllers/motor_detail_controller.dart';

class MotorDetailView extends GetView<MotorDetailController> {
  final int idMotor;
  const MotorDetailView({required this.idMotor, super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MotorDetailController(),
      builder: (controller) {
        var motorDetail = controller.motorDetailData.value;
        return Scaffold(
          backgroundColor: blackColor,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
              onPressed: () => Get.back(),
            ),
            backgroundColor: blackColor,
            elevation: 1,
            centerTitle: true,
            title: SizedBox(
              width: getActualY(y: 200, context: context),
              child: Image.asset('assets/images/TEAMAMUBA BARU.png'),
            ),
          ),
          body: controller.isLoadingMotorDetailData.value
              ? loadingShow(context)
              : motorDetail.success == false
                  ? loadingShow(context)
                  : Padding(
                      padding:
                          EdgeInsets.all(getActualY(y: 20, context: context)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //biodata
                            Container(
                              height: getActualY(y: 200, context: context),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(
                                  getActualY(y: 10, context: context),
                                ),
                                boxShadow: [defaultBoxShadow],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  getActualY(y: 10, context: context),
                                ),
                                child: imageNetwork(
                                    motorDetail.data?.mediaUrl ?? ''),
                              ),
                            ),
                            getSizedBox(size: 20, context: context),
                            //deskripsi
                            _containerDescription(
                                context, motorDetail.data?.description ?? ''),
                            getSizedBox(size: 20, context: context),
                            _containerListProduck(
                                context, motorDetail.data!.media!),
                          ],
                        ),
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
          'Spesifikasi Motor',
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

  Widget _containerListProduck(BuildContext context, List<Media> listDetail) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: listDetail.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: getActualY(y: 15, context: context),
        mainAxisSpacing: getActualY(y: 15, context: context),
      ),
      itemBuilder: (context, index) {
        var data = listDetail[index];
        return GestureDetector(
          onTap: () {
            Get.to(FullScreenPhotoView(
                imageUrls: data.mediaUrl!, text: data.description!));
          },
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(
                getActualY(y: 10, context: context),
              ),
              boxShadow: [defaultBoxShadow],
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        getActualY(y: 10, context: context),
                      ),
                      child: imageNetwork(data.thumbMediaUrl ?? '')),
                ),
                Positioned(
                  left: getActualX(x: 5, context: context),
                  right: getActualX(x: 5, context: context),
                  bottom: getActualY(y: 10, context: context),
                  child: Container(
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(
                            getActualY(y: 5, context: context))),
                    padding: EdgeInsets.all(getActualY(y: 5, context: context)),
                    child: Center(
                      child: Text(
                        removeHtmlTags(data.description ?? ''),
                        style: textPrimer(context: context).copyWith(
                          color: whiteColor,
                          fontSize: getActualY(y: 14, context: context),
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}

class FullScreenPhotoView extends StatelessWidget {
  final String imageUrls;
  final String text;

  FullScreenPhotoView({
    required this.imageUrls,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getActualX(x: 10, context: context),
            ),
            child: Text(
              removeHtmlTags(text),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: PhotoView(
        imageProvider: NetworkImage(imageUrls),
      ),
    );
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}
