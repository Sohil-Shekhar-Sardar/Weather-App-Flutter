import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:practice_project_flutter/widgets/constant_widgets.dart';

import '../utils/string_constants.dart';

class DogAppController extends GetxController {

  RxList cartDogList = [].obs;

  RxList<String> dogHistoryList = <String>[].obs;

  RxString imageUrl = "".obs;


  Future<void> fetchRandomDogImage() async {
    imageUrl.value = "";
    final response = await http.get(Uri.parse(apiUrl));
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        imageUrl.value = data['message'];
        dogHistoryList.add(imageUrl.value);
      }
    } catch (e) {
      errorSnackBar(message: e.toString());
    }
  }
}
