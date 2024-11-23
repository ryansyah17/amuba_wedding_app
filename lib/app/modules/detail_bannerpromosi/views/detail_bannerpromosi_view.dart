import 'package:amubavisual_weddingphoto/app/constant/const_color.dart';
import 'package:amubavisual_weddingphoto/app/constant/const_text.dart';
import 'package:amubavisual_weddingphoto/app/constant/constant.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../../../data/home_data/detail_banner_promosi.dart';
import '../controllers/detail_bannerpromosi_controller.dart';

class DetailBannerpromosiView extends GetView<DetailBannerpromosiController> {
  final int bannerId;
  const DetailBannerpromosiView({required this.bannerId, super.key});
  @override
  Widget build(BuildContext context) {
    var selectedColor = meganColorblack.obs; // warna default
    return GetBuilder<DetailBannerpromosiController>(
      init: DetailBannerpromosiController(),
      builder: (controller) {
        final CarouselSliderController _carouselSlider =
            CarouselSliderController();

        return Obx(() => Scaffold(
              backgroundColor:
                  selectedColor.value, // menggunakan warna yang dipilih
              appBar: AppBar(
                backgroundColor: blackColor,
                centerTitle: true,
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
              body: controller.isLoadingDetailBannerPromosi.value
                  ? loadingShow(context)
                  : controller.dataDetailBannerPromosi.value.success! == false
                      ? loadingShow(context)
                      : Column(
                          children: [
                            getSizedBox(size: 10, context: context),
                            _containerImageSlider(
                                context,
                                _carouselSlider,
                                controller
                                    .dataDetailBannerPromosi.value.sliderMedia!,
                                controller.current),
                            getSizedBox(size: 20, context: context),
                            controller.dataDetailBannerPromosi.value.slider!
                                        .isColorable ==
                                    false
                                ? SizedBox()
                                : _containerColor(
                                    context, selectedColor, controller),
                            _containerDescription(context, controller),
                          ],
                        ),
            ));
      },
    );
  }

  Widget _containerImageSlider(
    BuildContext context,
    CarouselSliderController _carouselSlider,
    List<SliderMedia> slides,
    RxInt _current,
  ) {
    return Column(
      children: [
        SizedBox(
          height: getActualY(y: 180, context: context),
          child: slides.isEmpty
              ? Center(
                  child: Text(
                    'Image Not Found',
                    style: textPrimer(context: context)
                        .copyWith(color: whiteColor),
                  ),
                )
              : Stack(
                  children: [
                    SizedBox(
                      height: getActualY(y: 180, context: context),
                      width: double.infinity,
                      child: CarouselSlider.builder(
                        carouselController: _carouselSlider,
                        itemCount: slides.length,
                        itemBuilder: (context, index, realIndex) {
                          var data = slides[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    getActualX(x: 12, context: context)),
                            width: double.infinity,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getActualY(y: 10, context: context)),
                                child: imageNetwork(data.thumbMediaUrl)),
                          );
                        },
                        options: CarouselOptions(
                          height: getActualY(y: 180, context: context),
                          autoPlay: false,
                          viewportFraction: 0.85,
                          onPageChanged: (index, reason) {
                            if (_current.value != index) {
                              _current.value = index;
                            }
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: getActualY(y: 20, context: context),
                      left: 0,
                      right: 0,
                      child: Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller
                              .dataDetailBannerPromosi.value.sliderMedia!
                              .asMap()
                              .entries
                              .map((entry) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      getActualX(x: 5, context: context)),
                              width: getActualY(
                                  y: _current.value == entry.key ? 15 : 7,
                                  context: context),
                              height: getActualY(y: 7, context: context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: _current.value == entry.key
                                    ? blackColor
                                    : greyColor,
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _containerDescription(
    BuildContext context,
    DetailBannerpromosiController controller,
  ) {
    var data = controller.dataDetailBannerPromosi.value;
    return Container(
      margin: EdgeInsets.all(getActualY(y: 20, context: context)),
      padding: EdgeInsets.all(
        getActualY(y: 20, context: context),
      ),
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          getActualY(y: 12, context: context),
        ),
        boxShadow: [defaultBoxShadow],
      ),
      child: HtmlWidget(
        data.slider?.description ?? '',
        textStyle: textPrimer(context: context).copyWith(color: whiteColor),
      ),
    );
  }
}

Widget _containerColor(BuildContext context, Rx<Color> selectedColor,
    DetailBannerpromosiController controller) {
  return Padding(
    padding:
        EdgeInsets.symmetric(horizontal: getActualX(x: 20, context: context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilihan warna yang menarik :',
          style: textPrimer(context: context).copyWith(color: whiteColor),
        ),
        getSizedBox(size: 10, context: context),
        SizedBox(
          height: getActualY(y: 40, context: context),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: meganColorList.length,
            itemBuilder: (context, index) {
              var data = meganColorList[index];
              return GestureDetector(
                onTap: () {
                  selectedColor.value = data.color; // update warna yang dipilih
                  controller.current.value =
                      index; // update current index to match selected color
                  print(selectedColor.value);
                },
                child: Obx(() => Container(
                      height: getActualY(y: 40, context: context),
                      width: getActualY(y: 40, context: context),
                      margin: EdgeInsets.symmetric(
                          horizontal: getActualX(x: 5, context: context)),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data.color,
                        border: Border.all(
                          color: selectedColor.value == data.color
                              ? Colors.white // border jika dipilih
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    ),
  );
}
