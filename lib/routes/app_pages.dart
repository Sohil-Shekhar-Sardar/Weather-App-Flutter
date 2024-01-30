import 'package:get/get.dart';
import 'package:practice_project_flutter/screens/cart_screen.dart';
import 'package:practice_project_flutter/screens/history_screen.dart';
import 'package:practice_project_flutter/screens/home_screen.dart';
import 'package:practice_project_flutter/screens/no_internet_connection_screen.dart';
import '../bindings/weather_app_binding.dart';
import 'routes.dart';

const Transition transition = Transition.fadeIn;

class AppPages {
  static const INITIAL_ROUTE = Routes.HOME_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.HISTORY_SCREEN,
      page: () => const HistoryScreen(),
      transition: transition,
      binding: dogAppBinding()
    ),
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => const HomeScreen(),
      transition: transition,
      binding: dogAppBinding()
    ),
    GetPage(
        name: Routes.NO_INTERNET_CONNECTION_SCREEN,
        page: () =>  const NoInternetConnectionScreen(),
        transition: transition,
        binding: dogAppBinding()
    ),
    GetPage(
        name: Routes.CART_SCREEN,
        page: () =>   const CartScreen(),
        transition: transition,
        binding: dogAppBinding()
    ),
  ];
}
