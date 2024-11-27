import 'package:amubavisual_weddingphoto/app/modules/my_team_page/views/my_team_page_view.dart';
import 'package:amubavisual_weddingphoto/app/modules/navbar/views/navbar_view.dart';
import 'package:amubavisual_weddingphoto/app/modules/produk_page/views/produk_page_view.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

import '../../home/views/home_view.dart';

class MainPageView extends StatefulWidget {
  final int? initialPage;

  const MainPageView({
    super.key,
    this.initialPage,
  });

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int selectedPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage ?? 0;
    pageController = PageController(initialPage: selectedPage);
  }

  Future<bool> _handleBackPressed() async {
    if (selectedPage != 0) {
      setState(() {
        selectedPage = 0;
      });
      pageController.jumpToPage(0); // Pindah ke halaman dengan indeks 0
      return false; // Mencegah aplikasi keluar
    }
    return true; // Izinkan keluar dari aplikasi jika sudah di halaman index 0
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBackPressed, // Mengganti PopScope dengan WillPopScope
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            SafeArea(
              child: Container(
                color: Colors.black12,
              ),
            ),
            SafeArea(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                },
                children: [
                  Center(
                    child: ProdukPageView(),
                  ),
                  Center(
                    child: UpgradeAlert(
                      dialogStyle: UpgradeDialogStyle.material,
                      showIgnore: false,
                      barrierDismissible: false,
                      child: HomeView(),
                    ),
                  ),
                  Center(
                    child: MyTeamPageView(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: NavbarView(
                selectedIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(selectedPage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
