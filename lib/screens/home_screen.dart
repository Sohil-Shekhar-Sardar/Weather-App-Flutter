import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:practice_project_flutter/controllers/dog_app_controller.dart';
import 'package:practice_project_flutter/utils/app_colors.dart';
import 'package:practice_project_flutter/widgets/button.dart';
import 'package:practice_project_flutter/widgets/constant_widgets.dart';
import 'package:sizer/sizer.dart';
import '../controllers/network_controller.dart';
import '../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  NetworkController networkController = Get.put(NetworkController(), permanent: true);
  DogAppController dogAppController = Get.find();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
    await dogAppController.fetchRandomDogImage();
    print(dogAppController.dogHistoryList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog App - Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(()=>
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                dogAppController.imageUrl.isNotEmpty
                    ? Container(
                        height: 50.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black,width: 2),
                          image: DecorationImage(image:NetworkImage(dogAppController.imageUrl.value),fit: BoxFit.fill)
                        ),
                )
                    : const CircularProgressIndicator(),
                const SizedBox(height: 20),
                CommonButton(
                  onPressed: ()async {
                   await dogAppController.fetchRandomDogImage();
                  },
                  label: 'Fetch New Image',
                ),
                const SizedBox(height: 10,),
                CommonButton(
                  onPressed: () {
                    if(dogAppController.imageUrl.value.isEmpty){
                      errorSnackBar(message: "Please fetch image");
                    }else {
                      dogAppController.cartDogList.add(dogAppController.imageUrl.value);
                      successSnackBar(message: "Successfully add to cart");
                    }
                  },
                  label: 'Add to Cart',
                ),
                const SizedBox(height: 10,),
                CommonButton(
                  onPressed: () {
                    Get.toNamed(Routes.HISTORY_SCREEN);
                  },
                  label: 'Show History',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }
