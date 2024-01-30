import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_project_flutter/utils/app_colors.dart';
import '../controllers/dog_app_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  DogAppController dogAppController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsForApp.primaryColor,
        title: const Text('Dog History'),
      ),
      body: dogAppController.dogHistoryList.isNotEmpty?
          const Center(
            child: Text("Data not found"),
          ):
      ListView.builder(
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                leading: Image.network(dogAppController.dogHistoryList[index]),
              ),
            );
          }
      )
    );
  }
}
