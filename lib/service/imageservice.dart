import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:upload/model/viewModel.dart';

class ImageService {
  static Future uploadService(File file) async {
    String fileName = file.path.split('/').last;


    Dio dio = Dio();


    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,

      ),
    });

    final response = await dio.post(
      "https://proplus-api.herokuapp.com/routes/upload",
      data: data,
    
       
    );

    

    if (response.statusCode == 200) {
     
      return true;
    } else {
      throw response.data;
    }
  }

  static Future<Task?> viewService() async {
    Dio dio = Dio();

    final response = await dio.get(
      "https://proplus-api.herokuapp.com/routes/view",
    );

    if (response.statusCode == 200) {
    
     return Task.fromJson(response.data);
    } else {
      return null;
    }
  }
}
