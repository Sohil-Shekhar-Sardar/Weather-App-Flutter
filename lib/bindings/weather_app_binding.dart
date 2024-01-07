import 'package:get/get.dart';
import '../controllers/weather_app_controller.dart';

class WeatherAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherAppController>(() => WeatherAppController());
  }
}
