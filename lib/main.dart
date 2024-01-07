import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:practice_project_flutter/bindings/weather_app_binding.dart';
import 'package:practice_project_flutter/routes/app_pages.dart';
import 'package:practice_project_flutter/screens/home_screen.dart';
import 'package:practice_project_flutter/screens/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';



Future<void> main()  async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          title: "Weather app",
          getPages: AppPages.routes,
          initialRoute:AppPages.INITIAL_ROUTE,
          initialBinding: WeatherAppBinding(),
        );
      },
    );
  }
}


// ignore: must_be_immutable
class AuthenticationWrapper extends StatelessWidget {
   const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user != null) {
              return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}