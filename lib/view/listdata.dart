import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:upload/controller/imageController.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var imagecontroller=Get.put(ImageController());


  @override
  void initState() {
    // TODO: implement initState
    imagecontroller.viewController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST DATA"),
      ),
      body: 
      Obx((){
      return ListView.builder(
        itemCount: imagecontroller.imageList.length,
        itemBuilder: ((context, index) {
        return Container(
          height: 200,
          child: Image.network(imagecontroller.imageList[index].media));
      }));
      
    }));
    
  }
}