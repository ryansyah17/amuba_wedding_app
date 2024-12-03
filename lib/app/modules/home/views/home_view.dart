import 'package:amubavisual_weddingphoto/app/constant/const_color.dart';
import 'package:amubavisual_weddingphoto/app/data/arguments/detail_event_arguments.dart';
import 'package:amubavisual_weddingphoto/app/modules/booking_services/views/booking_services_view.dart';
import 'package:amubavisual_weddingphoto/app/modules/detail_bannerpromosi/views/detail_bannerpromosi_view.dart';
import 'package:amubavisual_weddingphoto/app/modules/detail_event/views/detail_event_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant/const_text.dart';
import '../../../constant/constant.dart';
import '../../../data/arguments/detail_banner_promosi.dart';
import '../../../data/home_data/banner_promosi_data.dart' as promosi;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        final CarouselSliderController _carouselSlider =
            CarouselSliderController();
        var _current = 0.obs;

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
          body: controller.isLoadingBannerPromosiData.value
              ? loadingShow(context)
              : controller.promosiSlideData.value.success == false
                  ? loadingShow(context)
                  : RefreshIndicator(
                      onRefresh: () => Future.sync(() {
                        controller.fetchBannerPromosiData(true);
                        controller.fetchEventData(true, null);
                      }),
                      child: ListView(
                        children: [
                          _containerImageSlider(
                              context,
                              _carouselSlider,
                              controller.promosiSlideData.value.data!,
                              _current),
                          _containerDelivery(context),
                          getSizedBox(size: 20, context: context),
                          _containerListEvent(context, controller),
                          getSizedBox(size: 60, context: context),
                        ],
                      ),
                    ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
              bottom: getActualY(y: 70, context: context),
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () async {
                var sales =
                    controller.whatsappData.value.data?.whatsappNumber ?? '';
                await openUrl(
                    'https://api.whatsapp.com/send/?phone=%2B$sales&text&type=phone_number&app_absent=0');
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset('assets/icons/whatsapp.png'),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _containerImageSlider(
    BuildContext context,
    CarouselSliderController _carouselSlider,
    List<promosi.Data> slides,
    RxInt _current,
  ) {
    return Column(
      children: [
        Container(
          height: getActualY(y: 220, context: context),
          child: Stack(
            children: [
              SizedBox(
                height: getActualY(y: 220, context: context),
                width: double.infinity,
                child: CarouselSlider.builder(
                  carouselController: _carouselSlider,
                  itemCount: slides.length,
                  itemBuilder: (context, index, realIndex) {
                    var data = slides[index];
                    return GestureDetector(
                      onTap: () {
                        var args = DetailBannerPromosiArguments(
                          id: data.id!,
                        );
                        Get.to(
                            DetailBannerpromosiView(
                              bannerId: data.id!,
                            ),
                            arguments: args);
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: imageNetwork(data.thumbMediaUrl!),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: getActualY(y: 220, context: context),
                    autoPlay: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      if (_current.value != index) {
                        _current.value = index; // Update only if different
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
                    children: controller.promosiSlideData.value.data!
                        .asMap()
                        .entries
                        .map((entry) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: getActualX(x: 5, context: context)),
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

  Widget _containerDelivery(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Service Motor Listrik',
            style: textPrimer(context: context).copyWith(
              color: whiteColor,
              fontSize: getActualY(y: 16, context: context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(BookingServicesView());
          },
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: getActualY(y: 20, context: context)),
            height: getActualY(y: 180, context: context),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteColor,
              image: DecorationImage(
                  image: AssetImage('assets/images/amuba-visual-bg.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }

  Widget _containerListEvent(BuildContext context, HomeController homeCtrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getActualY(y: 20, context: context)),
          child: Text(
            'Download Foto Event',
            style: textPrimer(context: context).copyWith(
              color: whiteColor,
              fontSize: getActualY(y: 16, context: context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        getSizedBox(size: 10, context: context),
        //kategori
        homeCtrl.isLoadingKategoriData.value
            ? loadingShow(context)
            : homeCtrl.kategoriData.value.success! == false
                ? loadingShow(context)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: getActualY(y: 40, context: context),
                        width: getActualX(x: 200, context: context),
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            constraints: BoxConstraints(
                                maxHeight:
                                    getActualY(y: 120, context: context)),
                            showSelectedItems: true,
                            fit: FlexFit.tight,
                            disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: (filter, loadProps) =>
                              // ignore: invalid_use_of_protected_member
                              homeCtrl.kategori.value,
                          decoratorProps: DropDownDecoratorProps(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              contentPadding: EdgeInsets.all(
                                  getActualY(y: 10, context: context)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    getActualY(y: 10, context: context)),
                              ),
                              constraints: BoxConstraints(
                                maxHeight: getActualY(y: 120, context: context),
                              ),
                            ),
                            baseStyle: textPrimer(context: context),
                          ),
                          onChanged: (value) {
                            if (value == 'All') {
                              // Jika 'All' dipilih, panggil fetchHomeData
                              homeCtrl.fetchEventData(true, null);
                            } else {
                              homeCtrl.selectedid.value = controller
                                  .kategoriData.value.data!
                                  .firstWhere(
                                      (element) => element.name == value)
                                  .id!;
                              homeCtrl.fetchEventData(
                                  true, homeCtrl.selectedid.value);
                            }
                          },
                          selectedItem: 'All',
                        ),
                      ),
                    ],
                  ),

        //event data
        homeCtrl.isLoadingEventData.value
            ? loadingShow(context)
            : homeCtrl.eventData.value.success! == false
                ? loadingShow(context)
                : homeCtrl.eventData.value.data!.isEmpty
                    ? SizedBox(
                        height: getActualY(y: 300, context: context),
                        child: Center(
                          child: Text(
                            'Data Kosong',
                            style: textPrimer(context: context)
                                .copyWith(color: whiteColor),
                          ),
                        ),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.all(getActualY(y: 20, context: context)),
                        child: GridView.builder(
                          itemCount: homeCtrl.eventData.value.data!.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.8),
                          itemBuilder: (context, index) {
                            var data = homeCtrl.eventData.value.data![index];
                            return GestureDetector(
                              onTap: () {
                                var args = DetailEventArguments(id: data.id!);
                                Get.to(
                                    DetailEventView(
                                      eventId: data.id!,
                                    ),
                                    arguments: args);
                                print(data.id);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                        getActualY(y: 12, context: context)),
                                    margin: EdgeInsets.all(
                                        getActualY(y: 5, context: context)),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(
                                        getActualY(y: 12, context: context),
                                      ),
                                      border: Border.all(color: whiteColor),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            data.thumbMediaUrl!,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                        getActualY(y: 12, context: context)),
                                    margin: EdgeInsets.all(
                                        getActualY(y: 5, context: context)),
                                    decoration: BoxDecoration(
                                        color: whiteColor.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(
                                          getActualY(y: 12, context: context),
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: getActualY(
                                                  y: 15, context: context),
                                              vertical: getActualY(
                                                  y: 2, context: context)),
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getActualY(
                                                          y: 15,
                                                          context: context))),
                                          child: Text(
                                            '#${data.category!.name}',
                                            style: textPrimer(context: context)
                                                .copyWith(
                                              color: blackColor,
                                              fontSize: getActualY(
                                                  y: 12, context: context),
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration:
                                              BoxDecoration(color: whiteColor),
                                          child: Text(
                                            data.tanggalFormatted!,
                                            style: textPrimer(context: context)
                                                .copyWith(
                                              color: blackColor,
                                              fontSize: getActualY(
                                                  y: 12, context: context),
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
      ],
    );
  }

  Future<void> openUrl(String url,
      {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launch(url,
        forceSafariVC: forceWebView, enableJavaScript: enableJavaScript);
  }
}
