import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'controllers/themes/theme_style.dart';
import 'controllers/themes/theme_controller.dart';
import 'controllers/auth/auth_google.dart';
import 'package:tasks/controllers/auth/root_page_rules.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://eqylkwmyplkidbjztlbu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxeWxrd215cGxraWRianp0bGJ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMzMTY1NjUsImV4cCI6MjA0ODg5MjU2NX0.ktqA0Oujb0DFv9gunb5NjauHtKuCVLgDi_ScH0Yo_7Q',
  );

  Get.put(AuthController());
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasks',
        themeMode: themeController.themeMode.value,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: const RootPageRules(),
      );
    });
  }
}
