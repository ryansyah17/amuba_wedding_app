import 'package:amubavisual_weddingphoto/app/constant/const_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../../../constant/const_color.dart';
import '../../../constant/constant.dart';
import '../../../data/myteam_data/riders_detail_data.dart';
import '../controllers/riders_detail_controller.dart';

class RidersDetailView extends GetView<RidersDetailController> {
  final int idRiders;
  const RidersDetailView({required this.idRiders, super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RidersDetailController(),
      builder: (controller) {
        var ridersDetail = controller.ridersDetailData.value;
        return Scaffold(
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
          body: controller.isLoadingDetailRiders.value
              ? loadingShow(context)
              : ridersDetail.success == false
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
                                    ridersDetail.data?.mediaUrl ?? ''),
                              ),
                            ),
                            //deskripsi
                            getSizedBox(size: 20, context: context),
                            _bioadataPemain(context, ridersDetail.data!),
                            getSizedBox(size: 20, context: context),
                            _containerDescription(
                                context, ridersDetail.data?.deskripsi ?? ''),
                            getSizedBox(size: 20, context: context),
                            _containerMotor(
                                context, ridersDetail.data?.motor ?? []),
                            getSizedBox(size: 20, context: context),
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
          'Achievement',
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

  Widget _bioadataPemain(BuildContext context, Data dataPemain) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(getActualY(y: 10, context: context)),
          decoration: BoxDecoration(
            border: Border.all(color: whiteColor),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Tanggal Lahir : ',
                  style:
                      textPrimer(context: context).copyWith(color: whiteColor),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${dataPemain.tanggalLahir}',
                    style: textPrimer(context: context)
                        .copyWith(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(getActualY(y: 10, context: context)),
          decoration: BoxDecoration(
            border: Border.all(color: whiteColor),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Tinggi Badan : ',
                  style:
                      textPrimer(context: context).copyWith(color: whiteColor),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${dataPemain.tinggiBadanFormatted}',
                    style: textPrimer(context: context)
                        .copyWith(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(getActualY(y: 10, context: context)),
          decoration: BoxDecoration(
            border: Border.all(color: whiteColor),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Berat Badan : ',
                  style:
                      textPrimer(context: context).copyWith(color: whiteColor),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${dataPemain.beratBadanFormatted}',
                    style: textPrimer(context: context)
                        .copyWith(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(getActualY(y: 10, context: context)),
          decoration: BoxDecoration(
            border: Border.all(color: whiteColor),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Tempat Lahir : ',
                  style:
                      textPrimer(context: context).copyWith(color: whiteColor),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${dataPemain.kotaAsal}',
                    style: textPrimer(context: context)
                        .copyWith(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _containerStatistik(BuildContext context, Statistik dataStatistik) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Statisktik',
  //         style: textPrimer(context: context).copyWith(
  //           color: whiteColor,
  //           fontSize: getActualY(y: 16, context: context),
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       getSizedBox(size: 10, context: context),
  //       Container(
  //         padding: EdgeInsets.all(
  //           getActualY(y: 10, context: context),
  //         ),
  //         decoration: BoxDecoration(
  //           color: whiteColor.withOpacity(0.2),
  //           borderRadius: BorderRadius.circular(
  //             getActualY(y: 12, context: context),
  //           ),
  //           boxShadow: [defaultBoxShadow],
  //         ),
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     'Races',
  //                     style: textPrimer(context: context).copyWith(
  //                         color: whiteColor, fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     dataStatistik.race!,
  //                     style: textPrimer(context: context).copyWith(
  //                         color: whiteColor, fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               width: 1,
  //               height: getActualY(y: 50, context: context),
  //               color: whiteColor,
  //             ),
  //             Expanded(
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     'Poles',
  //                     style: textPrimer(context: context).copyWith(
  //                         color: whiteColor, fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     dataStatistik.poles!,
  //                     style: textPrimer(context: context).copyWith(
  //                         color: whiteColor, fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               width: 1,
  //               height: getActualY(y: 50, context: context),
  //               color: whiteColor,
  //             ),
  //             Expanded(
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     'Podium',
  //                     style: textPrimer(context: context).copyWith(
  //                         color: whiteColor, fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     dataStatistik.podium!,
  //                     style: textPrimer(context: context).copyWith(
  //                         color: whiteColor, fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               width: 1,
  //               height: getActualY(y: 50, context: context),
  //               color: whiteColor,
  //             ),
  //             Expanded(
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     'Juara',
  //                     style: textPrimer(context: context).copyWith(
  //                         color: whiteColor, fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     dataStatistik.victories!,
  //                     style: textPrimer(context: context).copyWith(
  //                         color: whiteColor, fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _containerMotor(BuildContext context, List<Motor> dataMotor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dokumentasi',
          style: textPrimer(context: context).copyWith(
            color: whiteColor,
            fontSize: getActualY(y: 16, context: context),
            fontWeight: FontWeight.bold,
          ),
        ),
        getSizedBox(size: 10, context: context),
        SizedBox(
          height: getActualY(y: 220, context: context),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            scrollDirection: Axis.vertical,
            itemCount: dataMotor.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var data = dataMotor[index];
              return Container(
                width: double.infinity,
                margin: EdgeInsets.all(getActualY(y: 10, context: context)),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(
                    getActualY(y: 10, context: context),
                  ),
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
                          child: imageNetwork(data.mediaUrl ?? '')),
                    ),
                    Positioned(
                      left: getActualX(x: 10, context: context),
                      right: getActualX(x: 10, context: context),
                      bottom: getActualY(y: 10, context: context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#${data.createdAtFormatted ?? ''}',
                            style: textPrimer(context: context).copyWith(
                              color: blackColor,
                              fontSize: getActualY(y: 12, context: context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
