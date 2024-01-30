
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:practice_project_flutter/bindings/weather_app_binding.dart';
import 'package:practice_project_flutter/routes/app_pages.dart';
import 'package:sizer/sizer.dart';



Future<void> main()  async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          smartManagement: SmartManagement.full,
          title: "Dog app",
          getPages: AppPages.routes,
          initialRoute:AppPages.INITIAL_ROUTE,
          initialBinding: dogAppBinding(),
        );
      },
    );
  }
}
