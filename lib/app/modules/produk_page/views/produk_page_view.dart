import 'package:amubavisual_weddingphoto/app/modules/produk_detail/views/produk_detail_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant/const_color.dart';
import '../../../constant/const_text.dart';
import '../../../constant/constant.dart';
import '../../../data/arguments/detail_produk_arguments.dart';
import '../controllers/produk_page_controller.dart';

class ProdukPageView extends GetView<ProdukPageController> {
  const ProdukPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProdukPageController(),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //info pemesanan
                Container(
                  padding: EdgeInsets.all(getActualY(y: 10, context: context)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                      getActualY(y: 12, context: context),
                    ),
                    boxShadow: [defaultBoxShadow],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Info Kontak',
                            style: textPrimer(context: context).copyWith(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: getActualY(y: 16, context: context),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Nomor WhatsApp : +${controller.whatsappData.value.data?.whatsappNumber ?? ''}',
                        style: textPrimer(context: context)
                            .copyWith(color: whiteColor),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alamat : ',
                            style: textPrimer(context: context)
                                .copyWith(color: whiteColor),
                          ),
                          Text(
                            'Jalan prof Jl. M. Yamin No.5, Aur Kuning, Kec. Aur Birugo Tigo Baleh, Kota Bukittinggi, Sumatera Barat 26131',
                            style: textPrimer(context: context)
                                .copyWith(color: whiteColor),
                          ),
                        ],
                      ),
                      getSizedBox(size: 10, context: context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                var sales = controller.whatsappData.value.data
                                        ?.whatsappNumber ??
                                    '';
                                await openUrl(
                                    'https://api.whatsapp.com/send/?phone=%2B$sales&text&type=phone_number&app_absent=0');
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    getActualY(y: 8, context: context)),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(
                                    getActualY(y: 6, context: context),
                                  ),
                                  boxShadow: [defaultBoxShadow],
                                ),
                                child: Center(
                                  child: Text(
                                    'Whatsapp',
                                    style:
                                        textPrimer(context: context).copyWith(
                                      color: whiteColor,
                                      fontSize:
                                          getActualY(y: 14, context: context),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          getWidthBox(size: 10, context: context),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await openUrl(
                                    'https://maps.app.goo.gl/eUb6PRf6rkvAFu777');
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    getActualY(y: 8, context: context)),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(
                                    getActualY(y: 6, context: context),
                                  ),
                                  boxShadow: [defaultBoxShadow],
                                ),
                                child: Center(
                                  child: Text(
                                    'Maps',
                                    style:
                                        textPrimer(context: context).copyWith(
                                      color: whiteColor,
                                      fontSize:
                                          getActualY(y: 14, context: context),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                getSizedBox(size: 20, context: context),
                Text('Produk',
                    style: textPrimer(context: context)
                        .copyWith(color: whiteColor)),
                getSizedBox(size: 10, context: context),
                Expanded(
                  child: _containerListProduck(context, controller),
                ),
                getSizedBox(size: 60, context: context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _containerListProduck(
      BuildContext context, ProdukPageController controller) {
    var produkData = controller.produkData.value;
    return controller.isLoadingWhatsAppData.value
        ? loadingShow(context)
        : produkData.success! == false
            ? loadingShow(context)
            : GridView.builder(
                shrinkWrap: true,
                itemCount: produkData.data?.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: getActualY(y: 15, context: context),
                  mainAxisSpacing: getActualY(y: 15, context: context),
                ),
                itemBuilder: (context, index) {
                  var data = produkData.data![index];
                  return GestureDetector(
                    onTap: () {
                      var args = DetailProdukArguments(
                        id: data.id!,
                      );
                      Get.to(
                          ProdukDetailView(
                            idProduk: data.id!,
                          ),
                          arguments: args);
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
                              padding: EdgeInsets.all(
                                  getActualY(y: 5, context: context)),
                              child: Center(
                                child: Text(
                                  data.namaProduk ?? '',
                                  style: textPrimer(context: context).copyWith(
                                    color: whiteColor,
                                    fontSize:
                                        getActualY(y: 14, context: context),
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
}
