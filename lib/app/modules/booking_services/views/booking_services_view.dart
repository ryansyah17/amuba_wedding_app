import 'package:amubavisual_weddingphoto/app/constant/const_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constant/const_color.dart';
import '../../../constant/constant.dart';
import '../controllers/booking_services_controller.dart';

class BookingServicesView extends GetView<BookingServicesController> {
  const BookingServicesView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BookingServicesController(),
      builder: (controller) {
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: greyColor,
                  width: double.infinity,
                  padding: EdgeInsets.all(getActualY(y: 10, context: context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Layanan',
                        style: textPrimer(context: context).copyWith(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: getActualY(y: 18, context: context),
                        ),
                      ),
                      Text(
                        'Booking Services',
                        style: textPrimer(context: context).copyWith(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: getActualY(y: 24, context: context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    getActualY(y: 20, context: context),
                  ),
                  child: Text(
                    'Silahkan Isi Form Berikut :',
                    style: textPrimer(context: context)
                        .copyWith(color: whiteColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getActualX(x: 20, context: context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //tanggal

                      Text(
                        'Pilih Tanggal',
                        style: textPrimer(context: context)
                            .copyWith(color: whiteColor),
                      ),
                      getSizedBox(size: 10, context: context),
                      GestureDetector(
                        onTap: () {
                          controller.selectDatePengeluaran(context);
                        },
                        child: Container(
                          height: getActualY(y: 40, context: context),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(
                                getActualY(y: 10, context: context)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                blurStyle: BlurStyle.solid,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                          ),
                          child: Obx(
                            () => Center(
                              child: Text(
                                controller.selectDate.value == null
                                    ? "Pilih Tanggal"
                                    : DateFormat('d MMM y')
                                        .format(controller.selectDate.value!),
                                style: textPrimer(context: context),
                              ),
                            ),
                          ),
                        ),
                      ),
                      getSizedBox(size: 20, context: context),

                      //jammm
                      Text(
                        'Pilih Jam',
                        style: textPrimer(context: context)
                            .copyWith(color: whiteColor),
                      ),
                      getSizedBox(size: 10, context: context),
                      SizedBox(
                        height: getActualY(y: 40, context: context),
                        width: double.infinity,
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            constraints: BoxConstraints(
                                maxHeight:
                                    getActualY(y: 300, context: context)),
                            showSelectedItems: true,
                            fit: FlexFit.tight,
                            disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: (filter, loadProps) =>
                              // ignore: invalid_use_of_protected_member
                              controller.jam.value,
                          decoratorProps: DropDownDecoratorProps(
                            decoration: InputDecoration(
                              filled: true,
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
                            controller.selectedTime.value = value!;
                          },
                          selectedItem: "",
                        ),
                      ),
                      getSizedBox(size: 20, context: context),

                      //Nama
                      Text(
                        'Atas Nama',
                        style: textPrimer(context: context)
                            .copyWith(color: whiteColor),
                      ),
                      getSizedBox(size: 10, context: context),
                      TextField(
                        controller: controller.namaController,
                        style: textPrimer(context: context),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                getActualY(y: 10, context: context)),
                          ),
                          filled: true,
                          fillColor: whiteColor,
                          hintText: 'Masukkan Nama',
                        ),
                      ),
                      getSizedBox(size: 20, context: context),

                      //nohp
                      Text(
                        'Nomor Handphone',
                        style: textPrimer(context: context)
                            .copyWith(color: whiteColor),
                      ),
                      getSizedBox(size: 10, context: context),
                      TextField(
                        controller: controller.nomorHpController,
                        style: textPrimer(context: context),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                getActualY(y: 10, context: context)),
                          ),
                          filled: true,
                          fillColor: whiteColor,
                          hintText: 'Masukkan Nomor Handphone',
                        ),
                      ),
                      getSizedBox(size: 20, context: context),

                      //Keterangan
                      Text(
                        'Keterangan',
                        style: textPrimer(context: context)
                            .copyWith(color: whiteColor),
                      ),
                      getSizedBox(size: 10, context: context),
                      TextField(
                        controller: controller.keteranganController,
                        style: textPrimer(context: context),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                getActualY(y: 10, context: context)),
                          ),
                          filled: true,
                          fillColor: whiteColor,
                          hintText: 'keterangan...',
                        ),
                        maxLines: 5,
                      ),
                      getSizedBox(size: 40, context: context),
                      GestureDetector(
                        onTap: () {
                          if (controller.nomorHpController.text.isEmpty ||
                              controller.namaController.text.isEmpty ||
                              controller.keteranganController.text.isEmpty ||
                              controller.selectDate.value == null ||
                              controller.selectedTime.value == "") {
                            showSnackbar(
                                title: 'Failed',
                                deskripsi: 'Data belum lengkap',
                                color: redGagalColor);
                          } else {
                            controller.postBookingServices(
                              controller.selectDate.value.toString(),
                              controller.selectedTime.value.toString(),
                              controller.namaController.text,
                              controller.nomorHpController.text,
                              controller.keteranganController.text,
                            );
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: getActualX(x: 20, context: context),
                          ),
                          width: double.infinity,
                          height: getActualY(y: 45, context: context),
                          decoration: BoxDecoration(
                            color: primerColor,
                            borderRadius: BorderRadius.circular(
                                getActualY(y: 10, context: context)),
                            boxShadow: [defaultBoxShadow],
                          ),
                          child: Center(
                            child: Text(
                              'Booking',
                              style: textPrimer(context: context).copyWith(
                                color: blackColor,
                                fontSize: getActualY(y: 14, context: context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      getSizedBox(size: 20, context: context)
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
}
