import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:practice_project_flutter/screens/fav_cities.dart';
import 'package:practice_project_flutter/screens/home_screen.dart';
import 'package:practice_project_flutter/screens/login_screen.dart';
import 'package:practice_project_flutter/screens/no_internet_connection_screen.dart';
import '../bindings/weather_app_binding.dart';
import '../main.dart';
import 'routes.dart';

const Transition transition = Transition.fadeIn;

class AppPages {
  static const INITIAL_ROUTE = Routes.AUTHENTICATION_WRAPPER;

  static final routes = [
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => const LoginScreen(),
      transition: transition,
      binding: WeatherAppBinding()
    ),
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => const HomeScreen(),
      transition: transition,
      binding: WeatherAppBinding()
    ),
    GetPage(
        name: Routes.NO_INTERNET_CONNECTION_SCREEN,
        page: () =>  const NoInternetConnectionScreen(),
        transition: transition,
        binding: WeatherAppBinding()
    ),
    GetPage(
        name: Routes.AUTHENTICATION_WRAPPER,
        page: () =>   AuthenticationWrapper(),
        transition: transition,
        binding: WeatherAppBinding()
    ),
    GetPage(
        name: Routes.FAV_CITY_LIST,
        page: () =>   const FavCityList(),
        transition: transition,
        binding: WeatherAppBinding()
    ),
  ];
}
