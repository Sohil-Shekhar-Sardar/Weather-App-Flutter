import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_project_flutter/controllers/dog_app_controller.dart';
import 'package:practice_project_flutter/utils/app_colors.dart';
import 'package:practice_project_flutter/utils/text_styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    DogAppController dogAppController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: ColorsForApp.primaryColor,
      ),
      body: dogAppController.cartDogList.isEmpty ?
          Center(
            child: Text("Data not found !",style: TextHelper.size14.copyWith(color: ColorsForApp.primaryColor),),
          )
          : ListView.builder(itemCount: dogAppController.cartDogList.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return Obx(()=>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      title: Image.network(dogAppController.cartDogList[index]),
                    trailing: GestureDetector(
                      onTap: (){
                        setState(() {
                          dogAppController.cartDogList.removeAt(index);
                        });
                      },
                        child: const Icon(Icons.delete,color: Colors.red,size: 20,)),
                    ),
                  ),
                ),
              ),
            );
          }
      )
    );
  }
}
