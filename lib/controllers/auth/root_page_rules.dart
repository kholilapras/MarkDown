import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/controllers/auth/auth_google.dart';
import 'package:tasks/pages/list_page.dart';
import 'package:tasks/pages/sign_in_page.dart';

class RootPageRules extends StatelessWidget {
  const RootPageRules({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Obx(() {
      if (authController.userId.value != null) {
        return const ListPage();
      } else {
        return SignInPage();
      }
    });
  }
}
