import 'package:emircan/view/eisenhower_view.dart';
import 'package:emircan/view/home_view.dart';
import 'package:emircan/view/profile_view.dart';
import 'package:flutter/material.dart';

import 'admob.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.admobInitialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //1
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeView.routeName,
      routes: routes,
    );
  }
}

final Map<String, WidgetBuilder> routes = {
  HomeView.routeName: (context) => const HomeView(),
  ProfilePage.routeName: (context) => const ProfilePage(),
  EisenhowerView.routeName: (context) => const EisenhowerView(),
};
