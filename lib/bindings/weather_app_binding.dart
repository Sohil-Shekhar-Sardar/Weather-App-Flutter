import 'package:get/get.dart';
import '../controllers/dog_app_controller.dart';

class dogAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DogAppController>(() => DogAppController());
  }
}
