import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class HomePageController extends GetxController {
  List userList = <UserModel>[];

  getUserList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        userList = (response.data as List).map((e) => UserModel.fromMap(e)).toList();
        update();
        print('liste oluşturuldu');
      }
    } catch (e) {
      print(e.toString());
    }

    return userList;
  }
}
