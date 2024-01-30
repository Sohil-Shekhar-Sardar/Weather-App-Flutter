import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:practice_project_flutter/controllers/dog_app_controller.dart';
import '../controllers/network_controller.dart';

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
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              dogAppController.imageUrl.isNotEmpty
                  ? Image.network(dogAppController.imageUrl.value)
                  : const CircularProgressIndicator(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async{
                 await dogAppController.fetchRandomDogImage();
                },
                child: const Text('Fetch New Image'),
              ),
              ElevatedButton(
                onPressed: () {
                  dogAppController.cartDogList.add(dogAppController.imageUrl.value);
                },
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
