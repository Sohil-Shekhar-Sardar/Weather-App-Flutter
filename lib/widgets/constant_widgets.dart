// Snack bar for showing error message
import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorSnackBar({String title = 'Failure', String? message}) {
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 1.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
      messageText: Text(
        message!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 1.0,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      snackPosition: SnackPosition.TOP,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red.withOpacity(0.80),
      icon: const Icon(Icons.gpp_bad_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 700),
    ),
  );
}

// Snack bar for showing success message
successSnackBar({String title = 'Success', String? message}) {
  Get.log('\x1B[92m[$title] => $message\x1B[0m');
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 1.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 1.0,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green.withOpacity(0.80),
      icon: const Icon(Icons.task_alt_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 700),
    ),
  );
}
