import 'dart:async';

import 'package:dio_example/core/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  void initState() {
    // TODO: implement initState
    //HomePageController controller = Get.put(HomePageController());
    controller.getUserList();
    print('controller');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIO EXAMPLE'),
        leading: IconButton(
            onPressed: () {
              controller.userList += controller.userList;
              setState(() {});
            },
            icon: const Icon(Icons.add)),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            return Obx(() => ListTile(
                  title: Text(controller.userList[index].name),
                  subtitle:
                      Text(controller.userList[index].address.city.toString()),
                ));
          }),
    );
  }
}

/*
ListView.builder(
itemBuilder: (context, index) {
return ListTile(
title: Text(controller.userList[index].name.toString()),
subtitle: Text(
controller.userList[index].address.city.toString(),
),
);
},
itemCount: controller.userList.length,
)
*/
