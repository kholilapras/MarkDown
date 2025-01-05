import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/controllers/auth/auth_google.dart';
import 'package:tasks/controllers/themes/theme_controller.dart';
import 'package:tasks/controllers/themes/theme_style.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final themeController = Get.find<ThemeController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FutureBuilder(
              future: authController.loadFromSharedPreferences(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final userAvailable = authController.userId.value != null;
                  return userAvailable
                      ? Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      authController.photoUrl.value ?? ''),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  authController.displayName.value ?? 'No Name',
                                ),
                                const SizedBox(height: 8),
                                Text(authController.email.value ?? ''),
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('No user data available.'),
                        );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Choose Theme', style: bodyText18),
                    RadioListTile<String>(
                      title: const Text('Light'),
                      value: 'light',
                      groupValue: themeController.themeMode.value.name,
                      onChanged: (value) {
                        if (value != null) {
                          themeController.saveTheme(value);
                        }
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Dark'),
                      value: 'dark',
                      groupValue: themeController.themeMode.value.name,
                      onChanged: (value) {
                        if (value != null) {
                          themeController.saveTheme(value);
                        }
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('System Default'),
                      value: 'system',
                      groupValue: themeController.themeMode.value.name,
                      onChanged: (value) {
                        if (value != null) {
                          themeController.saveTheme(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: authController.signOut,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
