import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../constant/const_color.dart';
import '../../../constant/const_text.dart';
import '../../../constant/constant.dart';
import '../controllers/detail_event_controller.dart';

class DetailEventView extends GetView<DetailEventController> {
  final int eventId;
  const DetailEventView({required this.eventId, super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailEventController(),
      builder: (controller) {
        if (controller.isLoadingDetailEvent.value) {
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
            body: loadingShow(context),
          );
        } else {
          var dataDetail = controller.detailEventData.value;
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
            body: RefreshIndicator(
              onRefresh: () => controller.fetchEventDetailData(true, page: 1),
              child: ListView(
                children: [
                  //image event
                  Container(
                    height: getActualY(y: 120, context: context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.2),
                    ),
                    child: imageNetwork(dataDetail.event!.thumbMediaUrl ?? ''),
                  ),
                  //data event
                  Padding(
                    padding: EdgeInsets.all(
                      getActualY(y: 20, context: context),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.all(getActualY(y: 10, context: context)),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: greyColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(
                          getActualY(y: 12, context: context),
                        ),
                        boxShadow: [defaultBoxShadow],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (dataDetail.event?.weddingNama ?? '')
                                    .toUpperCase(),
                                style: textPrimer(context: context).copyWith(
                                  color: whiteColor,
                                  fontSize: getActualY(y: 16, context: context),
                                ),
                              ),
                            ],
                          ),
                          getSizedBox(size: 10, context: context),
                          Text(
                            'Event : ${dataDetail.event?.category!.name ?? ''}',
                            style: textPrimer(context: context).copyWith(
                              color: whiteColor,
                            ),
                          ),
                          Text(
                            'Lokasi : ${dataDetail.event?.lokasi ?? ''}',
                            style: textPrimer(context: context).copyWith(
                              color: whiteColor,
                            ),
                          ),
                          Text(
                            'Tanggal : ${dataDetail.event?.tanggalFormatted ?? ''}',
                            style: textPrimer(context: context).copyWith(
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getActualY(y: 20, context: context)),
                    child: Text(
                      'Data Image',
                      style: textPrimer(context: context).copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ),
                  getSizedBox(size: 20, context: context),
                  //image
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getActualY(y: 20, context: context)),
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (!controller.isLoadingDetailEvent.value &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                          if (controller.detailEventData.value.media?.results
                                      .length !=
                                  null &&
                              controller.detailEventData.value.media!.results
                                          .length %
                                      20 ==
                                  0) {
                            controller.currentPage++;
                            controller.fetchEventDetailData(false,
                                page: controller.currentPage);
                          }
                        }
                        return true;
                      },
                      child: MasonryGridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller
                                .detailEventData.value.media?.results.length ??
                            0,
                        gridDelegate:
                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          var data = controller
                              .detailEventData.value.media?.results[index];
                          if (data == null) return SizedBox.shrink();
                          return Padding(
                            padding: EdgeInsets.all(
                                getActualY(y: 5, context: context)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  getActualY(y: 12, context: context)),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigasi ke halaman full screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullScreenPhotoView(
                                        imageUrls: controller.detailEventData
                                            .value.media!.results
                                            .map((e) => e.mediaUrl)
                                            .toList(),
                                        initialIndex: index,
                                      ),
                                    ),
                                  );
                                },
                                child: imageNetwork(data.thumbMediaUrl),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class FullScreenPhotoView extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;

  FullScreenPhotoView({required this.imageUrls, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailEventController>();
    controller.setCurrentIndex(initialIndex); // Set the initial index

    final PageController pageController =
        PageController(initialPage: initialIndex);

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
          TextButton(
            onPressed: () async {
              String imageUrl = imageUrls[controller.currentIndex.value];
              String imageName =
                  'image_${controller.currentIndex.value + 1}'; // Customize the name as needed

              // Call the function to save the image
              await controller.simpanGambarDariJaringan(imageUrl, imageName);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(6)),
              child: Text(
                'Download',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: PhotoViewGallery.builder(
        itemCount: imageUrls.length,
        builder: (context, index) {
          // Update the current index whenever the page changes
          pageController.addListener(() {
            controller.setCurrentIndex(pageController.page!.round());
          });

          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageUrls[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(color: Colors.black),
        pageController: pageController,
      ),
    );
  }
}