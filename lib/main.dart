import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp00/Screens/Splash_screen/splashscreen.dart';

import 'Screens/Admin_screen/views/home_page/home_page_admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  await Firebase.initializeApp(); //
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(


        debugShowCheckedModeBanner: false,
        title: 'Campino ',
        home: SplashScreen());
  }
}
