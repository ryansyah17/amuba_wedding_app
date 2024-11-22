import 'package:flutter/material.dart';

Color greyColor = Color(0xFF8d8d8d);
const Color primerColor = Color(0xFFFCEE21);
const Color secondaryColor = Color(0xFFF7931E);
Color blackColor = Color(0xFF000000);
const Color whiteColor = Color(0xFFFFFFFF);
const Color textDisable = Color(0xff919EAB);
const Color pinkColor = Color(0xFFCA07B6);
const Color blueColor = Color(0xFF3a99cf);
const Color goldColor = Color(0xFFF0A500);
Color redGagalColor = Colors.red.shade300;
Color color1 = Color(0xFFA307CA);
Color color2 = Color(0xFF2059CA);

///megancolor
const Color meganColorblack = Color(0xFF191921);
const Color meganColorPink = Color(0xFFdac1d7);
const Color meganColorRed = Color(0xFFb70724);
const Color meganColorBronze = Color(0xFF828280);
const Color meganColorHijau = Color(0xFF87aaa3);
const Color meganColorPutih = Color.fromARGB(255, 217, 224, 223);
const Color meganColorHijau2 = Color(0xFF6b828b);
const Color meganColorYellow = Color(0xFFFFE31A);
const Color meganColorOrange = Color(0xFFe16d00);
const Color meganColorUngu = Color(0xFF9193b9);

class MeganColor {
  final String name;
  final Color color;

  const MeganColor(this.name, this.color);
}

// Create a list of Megan colors
const List<MeganColor> meganColorList = [
  MeganColor('Megan Black', meganColorblack),
  MeganColor('Megan Pink', meganColorPink),
  MeganColor('Megan Red', meganColorRed),
  MeganColor('Megan Bronze', meganColorBronze),
  MeganColor('Megan Hijau', meganColorHijau),
  MeganColor('Megan Putih', meganColorPutih),
  MeganColor('Megan Hijau 2', meganColorHijau2),
  MeganColor('Megan Yellow', meganColorYellow),
  MeganColor('Megan Orange', meganColorOrange),
  MeganColor('Megan Ungu', meganColorUngu),
];
