import 'package:get/get.dart';
import 'package:tasks/controllers/supabase/database_helper.dart';

class SupabaseController extends GetxController {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  var listData = <Map<String, dynamic>>[].obs;
  var taskData = <Map<String, dynamic>>[].obs;
  var starredTaskData = <Map<String, dynamic>>[].obs;

  // CRUD list_table
  Future<void> fetchLists() async {
    try {
      final data = await databaseHelper.readLists();
      listData.value = data;
    } catch (e) {
      Get.snackbar(
        'Fetch Lists Failed',
        'Please check your internet connection and try again.',
      );
    }
  }

  Future<void> addList(Map<String, dynamic> data) async {
    try {
      await databaseHelper.createList(data);
      await fetchLists();
      Get.snackbar('Success', 'List added successfully');
    } catch (e) {
      Get.snackbar(
        'Add List Failed',
        'Please check your internet connection and try again.',
      );
    }
  }

  Future<void> deleteList(int id) async {
    try {
      await databaseHelper.deleteList(id);
      await fetchLists();
      Get.snackbar('Success', 'List deleted successfully');
    } catch (e) {
      Get.snackbar(
        'Delete List Failed',
        'Please check your internet connection and try again.',
      );
    }
  }

  // CRUD task_table
  Future<void> fetchTasks(String listName) async {
    try {
      final data = await databaseHelper.readTasks(listName);
      taskData.value = data;
    } catch (e) {
      Get.snackbar(
        'Fetch Tasks Failed',
        'Please check your internet connection and try again.',
      );
    }
  }

  Future<void> fetchStarredTasks() async {
    try {
      final data = await databaseHelper.readStarredTasks();
      starredTaskData.value = data;
    } catch (e) {
      Get.snackbar(
        'Fetch Starred Tasks Failed',
        'Please check your internet connection and try again.',
      );
    }
  }

  Future<void> addTask(Map<String, dynamic> data) async {
    try {
      await databaseHelper.createTask(data);
      await fetchTasks(data['list_name']);
      Get.snackbar('Success', 'Task added successfully');
    } catch (e) {
      Get.snackbar(
        'Add Task Failed',
        'Please check your internet connection and try again.',
      );
    }
  }

  Future<void> updateTask(int id, Map<String, dynamic> updatedData) async {
    try {
      await databaseHelper.updateTask(id, updatedData);
      await fetchTasks(updatedData['list_name']);
      Get.snackbar('Success', 'Task updated successfully');
    } catch (e) {
      Get.snackbar(
        'Update Task Failed',
        'Please check your internet connection and try again.',
      );
    }
  }

  Future<void> deleteTask(int id, String listName) async {
    try {
      await databaseHelper.deleteTask(id);
      await fetchTasks(listName);
      Get.snackbar('Success', 'Task deleted successfully');
    } catch (e) {
      Get.snackbar(
        'Delete Task Failed',
        'Please check your internet connection and try again.',
      );
    }
  }
}
