import 'dart:io';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:upload/model/viewModel.dart';
import 'package:upload/service/imageservice.dart';
import 'package:upload/view/listdata.dart';

class ImageController extends GetxController {
  var imageList = <Datum>[].obs;

  uploadController(File file) async {
    print("check");
    final result = await ImageService.uploadService(file);
print(result);


    if (result == true) {
      
      Get.to(ImageView());


    } else {
      throw result;
    }
  }

  viewController() async {
    final res=await ImageService.viewService();
    if(res!=null){

      imageList.value=res.data;
    
    }
    
  }
}
