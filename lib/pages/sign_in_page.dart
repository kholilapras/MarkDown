import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/controllers/auth/auth_google.dart';
import 'package:tasks/controllers/auth/loading_controller.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final AuthController authController = Get.put(AuthController());
  final LoadingController loadingController = Get.put(LoadingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 240),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'lib/assets/img/Google_Tasks_Logo.png',
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 240),
                  child: Column(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () async {
                          loadingController.startLoading();
                          await authController.signInWithGoogle();
                          loadingController.stopLoading();
                        },
                        icon: Image.asset(
                          'lib/assets/img/google_icon.png',
                          height: 25,
                          width: 25,
                        ),
                        label: const Text('Sign in with Google'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (loadingController.isLoading.value) _buildLoadingOverlay(),
        ],
      );
    });
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
