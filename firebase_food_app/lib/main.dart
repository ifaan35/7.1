import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize(); // flutter_screenutil
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDj7n5J0rT5OVjcfijRYqOfSPRmg6Iv92k",
      appId: "1:56724543746:android:bdff2002249a8c642b8a1b",
      messagingSenderId: "56724543746",
      projectId: "katalog-makanan-c5e6a",
      storageBucket: "gs://katalog-makanan-c5e6a.appspot.com",
    ),
  ); // firebase_core
  await GetStorage.init(); // get_storage
  tz.initializeTimeZones(); // timezone for local notification
  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          fontFamily: "Poppins",
        ),
      ),
    ),
  );
}
