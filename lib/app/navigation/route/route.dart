import 'package:flutter/material.dart' show PageRoute, RouteSettings;
import 'package:flutter_base_project/app/navigation/route/page_route_builder.dart';
import 'package:flutter_base_project/screens/navigation/drawer/main_drawer/main_drawer_screen.dart';

import '../../../screens/screens.dart';

typedef PageRouteFun = PageRoute Function(RouteSettings);

enum MainScreensEnum {
  init('/'),
  gameDetailScreen('/gameDetail'),
  mainScreen('/mainScreen');

  const MainScreensEnum(this.path);

  final String path;
}

Map<String, PageRouteFun> mainRoutesMap = {
  MainScreensEnum.init.path: (_) => goToPage(const SplashScreen(), _),
  MainScreensEnum.gameDetailScreen.path: (_) => goToPage(const GameDetailScreen(), _),
  MainScreensEnum.mainScreen.path: (_) => goToPage(const MainScreen(), _),
};


final drawerScreens = [
  const HomeScreen(),
  const StoreScreen(),
  const AccountScreen(),
];
