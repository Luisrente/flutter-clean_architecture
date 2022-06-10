import 'package:clean_architecture/models/models.dart';
import 'package:clean_architecture/pages/listview_builder_screen.dart';
import 'package:clean_architecture/pages/pages.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // TODO : borrar home

    MenuOption(
      route: 'listview1',
      name: 'Listview tipo 1',
      screen: const ListviewScreen(),
      icon: Icons.list_alt_outlined,
    ),
    MenuOption(
      route: 'listview2',
      name: 'Listview tipo 2',
      screen: const Listview2Screen(),
      icon: Icons.list_alt,
    ),
    MenuOption(
      route: 'alert',
      name: 'Alertas',
      screen: const AlertScreen(),
      icon: Icons.alarm_outlined,
    ),
    MenuOption(
      route: 'card',
      name: 'Targetas',
      screen: const CardScreen(),
      icon: Icons.credit_card_off,
    ),
    MenuOption(
      route: 'avatar',
      name: 'Circle Avatar',
      screen: const AvatarScreen(),
      icon: Icons.supervised_user_circle_outlined,
    ),
    MenuOption(
      route: 'animated',
      name: 'Animated Container',
      screen: const AnimatedScreen(),
      icon: Icons.animation_rounded,
    ),
    MenuOption(
      route: 'inputs',
      name: 'Inputs',
      screen: const InputsScreen(),
      icon: Icons.input_outlined,
    ),
    MenuOption(
      route: 'slider',
      name: 'Slider && Checks',
      screen: const SliderScreen(),
      icon: Icons.check_sharp,
    ),
    MenuOption(
      route: 'listviewBuilder',
      name: 'listview',
      screen: const ListviewbuilderScreen(),
      icon: Icons.code_sharp,
    )
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (var option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const ListviewScreen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
