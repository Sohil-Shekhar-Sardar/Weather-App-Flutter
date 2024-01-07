import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_project_flutter/controllers/weather_app_controller.dart';
import 'package:practice_project_flutter/utils/app_colors.dart';
import 'package:practice_project_flutter/utils/text_styles.dart';

class FavCityList extends StatefulWidget {
  const FavCityList({super.key});

  @override
  State<FavCityList> createState() => _FavCityListState();
}

class _FavCityListState extends State<FavCityList> {
  @override
  Widget build(BuildContext context) {
    WeatherAppController weatherAppController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Cities"),
        backgroundColor: ColorsForApp.primaryColor,
      ),
      body: weatherAppController.cityList.isEmpty ?
          Center(
            child: Text("Please add cities",style: TextHelper.size14.copyWith(color: ColorsForApp.primaryColor),),
          )
          : ListView.builder(itemCount: weatherAppController.cityList.length,
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
                      title:  Text(weatherAppController.cityList[index],style: TextHelper.size20.copyWith(color: ColorsForApp.primaryColor),),
                    trailing: GestureDetector(
                      onTap: (){
                        setState(() {
                          weatherAppController.cityList.removeAt(index);
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
