import 'package:dalel/core/assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/bazar/presentation/views/bazar_view.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class HoemBottomNavBar extends StatelessWidget {
  const HoemBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        screens: _buildScreens(),
        controller: _controller,
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style12,
        backgroundColor: AppColors.primaryColor,
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            colorBehindNavBar: Colors.white),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomeView(),
    BazarView(),
    SearchView(),
    ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.assetsImagesNavBarLightHome),
        icon: SvgPicture.asset(Assets.assetsImagesNavBarBoldHome)),
    PersistentBottomNavBarItem(
        inactiveIcon:
            SvgPicture.asset(Assets.assetsImagesNavBarLightShoppingCart),
        icon: SvgPicture.asset(Assets.assetsImagesNavBarBoldShoppingCart)),
    PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.assetsImagesNavBarLightSearch),
        icon: SvgPicture.asset(Assets.assetsImagesNavBarBoldSearch)),
    PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.assetsImagesNavBarLightProfile),
        icon: SvgPicture.asset(Assets.assetsImagesNavBarBoldProfile)),
  ];
}
