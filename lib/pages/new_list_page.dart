import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/controllers/supabase/supabase_controller.dart';

class NewListPage extends StatelessWidget {
  NewListPage({super.key});

  final TextEditingController titleController = TextEditingController();
  final SupabaseController supabaseController = Get.find<SupabaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Create new list'),
        actions: [
          TextButton(
            onPressed: () {
              final title = titleController.text.trim();
              if (title.isEmpty) {
                Get.snackbar('Error', 'Title cannot be empty');
                return;
              }
              final newList = {'name': title};
              supabaseController.addList(newList);
              Get.back();
            },
            child: const Text('Done'),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: 'Enter list title',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
        ),
      ),
    );
  }
}
