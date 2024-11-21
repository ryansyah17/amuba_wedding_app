import 'package:amubavisual_weddingphoto/app/constant/const_color.dart';
import 'package:amubavisual_weddingphoto/app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../constant/const_text.dart';
import '../../home/views/home_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _manualInputController;
  late Animation<Offset> _manualInputAnimation;
  late AnimationController _qrCodeController;
  late Animation<Offset> _qrCodeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation for Welcome Text
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Animation for Manual Input
    _manualInputController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _manualInputAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // Masuk dari kiri
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _manualInputController,
      curve: Curves.easeIn,
    ));

    // Animation for QR Code
    _qrCodeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _qrCodeAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0), // Masuk dari kanan
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _qrCodeController,
      curve: Curves.easeIn,
    ));

    // Memulai animasi setelah beberapa detik
    Future.delayed(Duration(milliseconds: 100), () {
      _controller.forward();
      _manualInputController.forward();
      _qrCodeController.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _manualInputController.dispose();
    _qrCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/amuba-visual-bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimation,
              child: _containerTextWelcome(context),
            ),
            getSizedBox(size: 30, context: context),
            _containerSelectedMetode(context),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Text(
        '#AmubaVisual',
        style: textPrimer(context: context).copyWith(
          color: whiteColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _containerTextWelcome(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome',
          style: GoogleFonts.sigmar(
            fontSize: getActualY(
              y: 40,
              context: context,
            ),
            color: whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Amuba Visual Wedding Photo',
          style: GoogleFonts.sigmar(
            fontSize: getActualY(
              y: 25,
              context: context,
            ),
            color: whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _containerSelectedMetode(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getActualY(y: 20, context: context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _manualInputAnimation,
            child: InkWell(
              onTap: () {
                Get.offAll(HomeView());
              },
              child: Container(
                padding: EdgeInsets.all(getActualY(y: 10, context: context)),
                height: getActualY(y: 140, context: context),
                width: getActualY(y: 140, context: context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getActualY(y: 12, context: context),
                  ),
                  border: Border.all(),
                  boxShadow: [defaultBoxShadow],
                  color: whiteColor,
                ),
                child: Center(
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(
                      getActualY(y: 12, context: context),
                    ),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/amuba-visual-bg.jpg'),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/quill-pen.png'),
                              getSizedBox(size: 10, context: context),
                              Text(
                                'Manual Input',
                                style: textPrimer(context: context).copyWith(
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          getWidthBox(size: 20, context: context),
          SlideTransition(
            position: _qrCodeAnimation,
            child: InkWell(
              onTap: () {
                Get.offAll(HomeView());
              },
              child: Container(
                padding: EdgeInsets.all(getActualY(y: 10, context: context)),
                height: getActualY(y: 140, context: context),
                width: getActualY(y: 140, context: context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getActualY(y: 12, context: context),
                  ),
                  border: Border.all(),
                  boxShadow: [defaultBoxShadow],
                  color: whiteColor,
                ),
                child: Center(
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(
                      getActualY(y: 12, context: context),
                    ),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/amuba-visual-bg.jpg'),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/qr-code.png'),
                              getSizedBox(size: 10, context: context),
                              Text(
                                'Scan QR Code',
                                style: textPrimer(context: context).copyWith(
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
