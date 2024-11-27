import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant/const_color.dart';
import '../../../constant/const_text.dart';
import '../../../constant/constant.dart';
import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  final int? selectedIndex;
  final Function(int index)? onTap;
  NavbarView({super.key, this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getActualY(y: 10, context: context)),
      padding:
          EdgeInsets.symmetric(horizontal: getActualY(y: 20, context: context)),
      height: getActualY(y: 60, context: context),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          getActualY(y: 10, context: context),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //myprduct
              GestureDetector(
                onTap: () {
                  if (onTap != null) {
                    onTap!(0);
                  }
                },
                child: selectedIndex == 0
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                              getActualY(y: 8, context: context),
                            ),
                            decoration: BoxDecoration(
                              color: blackColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          getSizedBox(size: 5, context: context),
                          Container(
                            child: Text(
                              'My Product',
                              style: textPrimer(context: context).copyWith(
                                  color: blackColor,
                                  fontSize:
                                      getActualY(y: 12, context: context)),
                              textScaleFactor: 1.0,
                            ),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.my_library_books,
                        size: 30,
                        color: greyColor,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  if (onTap != null) {
                    onTap!(1);
                  }
                },
                child: selectedIndex == 1
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                              getActualY(y: 8, context: context),
                            ),
                            decoration: BoxDecoration(
                              color: blackColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          getSizedBox(size: 5, context: context),
                          Container(
                            child: Text(
                              'Home',
                              style: textPrimer(context: context).copyWith(
                                  color: blackColor,
                                  fontSize:
                                      getActualY(y: 12, context: context)),
                              textScaleFactor: 1.0,
                            ),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.home_filled,
                        size: 30,
                        color: greyColor,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  if (onTap != null) {
                    onTap!(2);
                  }
                },
                child: selectedIndex == 2
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                              getActualY(y: 8, context: context),
                            ),
                            decoration: BoxDecoration(
                              color: blackColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          getSizedBox(size: 5, context: context),
                          Container(
                            child: Text(
                              'My Team',
                              style: textPrimer(context: context).copyWith(
                                  color: blackColor,
                                  fontSize:
                                      getActualY(y: 12, context: context)),
                              textScaleFactor: 1.0,
                            ),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.motorcycle,
                        size: 30,
                        color: greyColor,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
