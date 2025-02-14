import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_with_restapi/res/getx_localization/language.dart';
import 'package:getx_mvvm_with_restapi/res/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jakaria',
      translations: Language(),
      locale: const Locale('en', 'US'),
      // locale kaj na korle fallback locale execute hobe
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
