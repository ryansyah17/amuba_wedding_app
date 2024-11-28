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
                            Row(
                              children: [
                                Container(
                                  height: getActualY(y: 200, context: context),
                                  width: getActualX(x: 140, context: context),
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
                                getWidthBox(size: 20, context: context),
                                Expanded(
                                  child: Container(
                                    height:
                                        getActualY(y: 200, context: context),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nama : ${ridersDetail.data?.namaLengkap ?? ''}',
                                          style: textPrimer(context: context)
                                              .copyWith(color: whiteColor),
                                        ),
                                        Text(
                                          'Julukan: ${ridersDetail.data?.namaJulukan ?? ''}',
                                          style: textPrimer(context: context)
                                              .copyWith(color: whiteColor),
                                        ),
                                        Text(
                                          'Tanggal Lahir : ${ridersDetail.data?.tanggalLahir ?? ''}',
                                          style: textPrimer(context: context)
                                              .copyWith(color: whiteColor),
                                        ),
                                        Text(
                                          'Usia : ${ridersDetail.data?.usiaPembalapFormatted ?? ''}',
                                          style: textPrimer(context: context)
                                              .copyWith(color: whiteColor),
                                        ),
                                        Text(
                                          'Kota Asal : ${ridersDetail.data?.kotaAsal ?? ''}',
                                          style: textPrimer(context: context)
                                              .copyWith(color: whiteColor),
                                        ),
                                        Text(
                                          'Tinggi Badan: ${ridersDetail.data?.tinggiBadanFormatted ?? ''}',
                                          style: textPrimer(context: context)
                                              .copyWith(color: whiteColor),
                                        ),
                                        Text(
                                          'Berat Badan: ${ridersDetail.data?.beratBadanFormatted ?? ''}',
                                          style: textPrimer(context: context)
                                              .copyWith(color: whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //deskripsi
                            getSizedBox(size: 20, context: context),
                            _containerStatistik(
                                context, ridersDetail.data!.statistik!),
                            getSizedBox(size: 20, context: context),
                            _containerDescription(
                                context, ridersDetail.data?.deskripsi ?? ''),
                            getSizedBox(size: 20, context: context),
                            _containerMotor(
                                context, ridersDetail.data?.motor ?? []),
                            getSizedBox(size: 20, context: context),
                            _containerKejuaraan(
                                context, ridersDetail.data?.history ?? [])
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
          'Prestasi Riders',
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

  Widget _containerStatistik(BuildContext context, Statistik dataStatistik) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statisktik',
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
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Races',
                      style: textPrimer(context: context).copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataStatistik.race!,
                      style: textPrimer(context: context).copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: getActualY(y: 50, context: context),
                color: whiteColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Poles',
                      style: textPrimer(context: context).copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataStatistik.poles!,
                      style: textPrimer(context: context).copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: getActualY(y: 50, context: context),
                color: whiteColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Podium',
                      style: textPrimer(context: context).copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataStatistik.podium!,
                      style: textPrimer(context: context).copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: getActualY(y: 50, context: context),
                color: whiteColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Juara',
                      style: textPrimer(context: context).copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataStatistik.victories!,
                      style: textPrimer(context: context).copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _containerMotor(BuildContext context, List<Motor> dataMotor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Motor',
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
            itemCount: dataMotor.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var data = dataMotor[index];
              return Container(
                width: getActualY(y: 150, context: context),
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

  Widget _containerKejuaraan(BuildContext context, List<History> dataHistory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kejuaraan',
          style: textPrimer(context: context).copyWith(
            color: whiteColor,
            fontSize: getActualY(y: 16, context: context),
            fontWeight: FontWeight.bold,
          ),
        ),
        getSizedBox(size: 10, context: context),
        SizedBox(
          height: getActualY(y: 150, context: context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataHistory.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var data = dataHistory[index];
              return Container(
                width: getActualY(y: 200, context: context),
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
                      left: getActualX(x: 0, context: context),
                      right: getActualX(x: 0, context: context),
                      bottom: getActualY(y: 0, context: context),
                      child: Container(
                        width: double.infinity,
                        color: greyColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: getActualY(y: 10, context: context),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '#${data.peringkat ?? ''}',
                              style: textPrimer(context: context).copyWith(
                                color: blackColor,
                                fontSize: getActualY(y: 14, context: context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${data.namaKejuaraan ?? ''} | ${data.kelas}',
                              style: textPrimer(context: context).copyWith(
                                color: blackColor,
                                fontSize: getActualY(y: 12, context: context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
