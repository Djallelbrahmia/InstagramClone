import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/utility/global_variables.dart';

import '../utility/colors.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController;

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          centerTitle: false,
          title: SvgPicture.asset(
            'assets/ic_instagram.svg',
            color: primaryColor,
            height: 32,
          ),
          actions: [
            IconButton(
                onPressed: () => navigationTapped(0),
                icon: Icon(
                  Icons.home,
                  color: _page == 0 ? primaryColor : secondaryColor,
                )),
            IconButton(
                onPressed: () => navigationTapped(1),
                icon: Icon(
                  Icons.search,
                  color: _page == 1 ? primaryColor : secondaryColor,
                )),
            IconButton(
                onPressed: () => navigationTapped(2),
                icon: Icon(
                  Icons.add_a_photo,
                  color: _page == 2 ? primaryColor : secondaryColor,
                )),
            IconButton(
                onPressed: () => navigationTapped(3),
                icon: Icon(
                  Icons.favorite,
                  color: _page == 3 ? primaryColor : secondaryColor,
                )),
            IconButton(
                onPressed: () => navigationTapped(4),
                icon: Icon(
                  Icons.person,
                  color: _page == 4 ? primaryColor : secondaryColor,
                )),
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: homeScreenItems,
        ),
      ),
    );
  }
}
