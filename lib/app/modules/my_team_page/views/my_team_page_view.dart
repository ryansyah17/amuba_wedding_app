import 'package:amubavisual_weddingphoto/app/constant/const_text.dart';
import 'package:amubavisual_weddingphoto/app/data/arguments/detail_artikel_arguments.dart';
import 'package:amubavisual_weddingphoto/app/data/arguments/detail_riders_arguments.dart';
import 'package:amubavisual_weddingphoto/app/modules/motor_detail/views/motor_detail_view.dart';
import 'package:amubavisual_weddingphoto/app/modules/riders_detail/views/riders_detail_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant/const_color.dart';
import '../../../constant/constant.dart';
import '../../../data/arguments/detail_motor_arguments.dart';
import '../../artikel_detail/views/artikel_detail_view.dart';
import '../controllers/my_team_page_controller.dart';

class MyTeamPageView extends GetView<MyTeamPageController> {
  const MyTeamPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MyTeamPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: blackColor,
          appBar: AppBar(
            backgroundColor: blackColor,
            elevation: 1,
            centerTitle: true,
            title: SizedBox(
              width: getActualY(y: 200, context: context),
              child: Image.asset('assets/images/TEAMAMUBA BARU.png'),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(getActualY(y: 20, context: context)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _containerProfilePembalap(context, controller),
                  getSizedBox(size: 20, context: context),
                  _containerProfileMotor(context, controller),
                  getSizedBox(size: 20, context: context),
                  _containerProfilePenghargaraan(context, controller),
                  getSizedBox(size: 20, context: context),
                  _containerArtikel(context, controller),
                  getSizedBox(size: 60, context: context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _containerProfilePembalap(
      BuildContext context, MyTeamPageController controller) {
    var ridersData = controller.ridersData.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile Pembalap',
          style: textPrimer(context: context).copyWith(color: whiteColor),
        ),
        getSizedBox(size: 10, context: context),
        SizedBox(
          height: getActualY(y: 200, context: context),
          child: controller.isLoadingRiders.value
              ? loadingShow(context)
              : ridersData.success == false
                  ? loadingShow(context)
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: ridersData.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = ridersData.data![index];
                        return InkWell(
                          onTap: () {
                            var args = DetailRidersArguments(id: data.id!);
                            Get.to(
                                RidersDetailView(
                                  idRiders: data.id!,
                                ),
                                arguments: args);
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                              getActualY(y: 10, context: context),
                            ),
                            width: getActualX(x: 160, context: context),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(
                                  getActualY(y: 10, context: context),
                                ),
                                boxShadow: [defaultBoxShadow],
                                border: Border.all(color: whiteColor)),
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
                                      child: imageNetwork(data.mediaUrl ?? '')),
                                ),
                                Positioned(
                                  left: getActualX(x: 10, context: context),
                                  right: getActualX(x: 10, context: context),
                                  bottom: getActualY(y: 10, context: context),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '#${data.namaJulukan ?? ''}',
                                        style: textPrimer(context: context)
                                            .copyWith(
                                          color: whiteColor,
                                          fontSize: getActualY(
                                              y: 14, context: context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${data.namaLengkap}',
                                        style: textPrimer(context: context)
                                            .copyWith(
                                          color: whiteColor,
                                          fontSize: getActualY(
                                              y: 16, context: context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }

  Widget _containerProfileMotor(
      BuildContext context, MyTeamPageController controller) {
    var motorData = controller.motorData.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile Motor',
          style: textPrimer(context: context).copyWith(color: whiteColor),
        ),
        getSizedBox(size: 10, context: context),
        SizedBox(
          height: getActualY(y: 150, context: context),
          child: controller.isLoadingMotor.value
              ? loadingShow(context)
              : motorData.success == false
                  ? loadingShow(context)
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: motorData.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = motorData.data![index];
                        return InkWell(
                          onTap: () {
                            var args = DetailMotorArguments(id: data.id);
                            Get.to(
                                MotorDetailView(
                                  idMotor: data.id,
                                ),
                                arguments: args);
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                              getActualY(y: 10, context: context),
                            ),
                            width: getActualX(x: 250, context: context),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(
                                  getActualY(y: 10, context: context),
                                ),
                                boxShadow: [defaultBoxShadow],
                                border: Border.all(color: whiteColor)),
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
                                      child: imageNetwork(data.mediaUrl)),
                                ),
                                Positioned(
                                  left: getActualX(x: 10, context: context),
                                  right: getActualX(x: 10, context: context),
                                  bottom: getActualY(y: 10, context: context),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        style: textPrimer(context: context)
                                            .copyWith(
                                          color: whiteColor,
                                          fontSize: getActualY(
                                              y: 14, context: context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        removeHtmlTags(data.description),
                                        style: textPrimer(context: context)
                                            .copyWith(
                                          color: whiteColor,
                                          fontSize: getActualY(
                                              y: 16, context: context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }

  Widget _containerProfilePenghargaraan(
      BuildContext context, MyTeamPageController controller) {
    var penghargaanData = controller.penghargaanData.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Penghargaan',
          style: textPrimer(context: context).copyWith(color: whiteColor),
        ),
        getSizedBox(size: 10, context: context),
        SizedBox(
          height: getActualY(y: 150, context: context),
          child: controller.isLoadingPenghargaan.value
              ? loadingShow(context)
              : penghargaanData.success == false
                  ? loadingShow(context)
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: penghargaanData.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = penghargaanData.data![index];
                        return InkWell(
                          onTap: () {
                            showDialogDetail(context, data.title,
                                data.description, data.mediaUrl);
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                              getActualY(y: 10, context: context),
                            ),
                            width: getActualY(y: 150, context: context),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(
                                  getActualY(y: 10, context: context),
                                ),
                                boxShadow: [defaultBoxShadow],
                                border: Border.all(color: whiteColor)),
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
                                      child: imageNetwork(data.mediaUrl)),
                                ),
                                Positioned(
                                  left: getActualX(x: 10, context: context),
                                  right: getActualX(x: 10, context: context),
                                  bottom: getActualY(y: 10, context: context),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        style: textPrimer(context: context)
                                            .copyWith(
                                          color: whiteColor,
                                          fontSize: getActualY(
                                              y: 14, context: context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }

  Widget _containerArtikel(
      BuildContext context, MyTeamPageController controller) {
    var artikelData = controller.artikelData.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Artikel',
          style: textPrimer(context: context).copyWith(color: whiteColor),
        ),
        getSizedBox(size: 10, context: context),
        controller.isLoadingArtikel.value
            ? loadingShow(context)
            : artikelData.success == false
                ? loadingShow(context)
                : ListView.builder(
                    itemCount: artikelData.data?.length ?? 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = artikelData.data![index];
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: getActualY(y: 20, context: context)),
                        child: Row(
                          children: [
                            SizedBox(
                              height: getActualY(y: 140, context: context),
                              width: getActualY(y: 100, context: context),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getActualY(y: 10, context: context)),
                                child: imageNetwork(data.thumbMediaUrl),
                              ),
                            ),
                            getWidthBox(size: 5, context: context),
                            Expanded(
                              child: Container(
                                height: getActualY(y: 140, context: context),
                                padding: EdgeInsets.all(
                                    getActualY(y: 10, context: context)),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(
                                    getActualY(y: 10, context: context),
                                  ),
                                  boxShadow: [defaultBoxShadow],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title,
                                      style:
                                          textPrimer(context: context).copyWith(
                                        color: blackColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      removeHtmlTags(data.description),
                                      style:
                                          textPrimer(context: context).copyWith(
                                        color: blackColor,
                                        fontSize:
                                            getActualY(y: 12, context: context),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          var args = DetailArtikelArguments(
                                              id: data.id);
                                          Get.to(
                                              ArtikelDetailView(
                                                idArtikel: data.id,
                                              ),
                                              arguments: args);
                                        },
                                        child: Text(
                                          'Read More',
                                          style: textPrimer(context: context)
                                              .copyWith(
                                            color: blueColor,
                                            fontSize: getActualY(
                                                y: 12, context: context),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
      ],
    );
  }

  showDialogDetail(
      BuildContext context, String title, String description, String image) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: whiteColor,
        title: Text(
          title,
          style: textPrimer(context: context).copyWith(
            color: blackColor,
            fontSize: getActualY(y: 16, context: context),
          ),
        ),
        content: Container(
          width: double.infinity,
          height: getActualY(y: 300, context: context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  removeHtmlTags(description),
                  style:
                      textPrimer(context: context).copyWith(color: blackColor),
                ),
                getSizedBox(size: 10, context: context),
                imageNetwork(image),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}
