import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const_color.dart';
import 'constant.dart';

TextStyle textLogoSplash({required BuildContext context}) {
  return GoogleFonts.bungee(
    color: primerColor,
    fontWeight: FontWeight.w400,
    fontSize: getActualY(
      y: 40,
      context: context,
    ),
  );
}

TextStyle textsplash({required BuildContext context}) {
  return GoogleFonts.bungee(
    color: whiteColor,
    fontWeight: FontWeight.w400,
    fontSize: getActualY(
      y: 30,
      context: context,
    ),
  );
}

TextStyle textTitle({required BuildContext context}) {
  return GoogleFonts.poppins(
    color: blackColor,
    fontWeight: FontWeight.w600,
    fontSize: getActualY(
      y: 26,
      context: context,
    ),
  );
}

TextStyle textDescribe({required BuildContext context}) {
  return GoogleFonts.poppins(
    color: greyColor,
    fontWeight: FontWeight.w400,
    fontSize: getActualY(
      y: 14,
      context: context,
    ),
  );
}

TextStyle textPrimer({required BuildContext context}) {
  return GoogleFonts.montserrat(
    color: blackColor,
    fontSize: getActualY(
      y: 14,
      context: context,
    ),
  );
}

TextStyle textTabbar({required BuildContext context}) {
  return GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    fontSize: getActualY(
      y: 10,
      context: context,
    ),
  );
}
