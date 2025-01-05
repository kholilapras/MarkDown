import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseHelper {
  final SupabaseClient supabase = Supabase.instance.client;

  void verifyAuth() {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User is not logged in.');
    }
  }

  String get userId {
    verifyAuth();
    return supabase.auth.currentUser!.id;
  }

  // CRUD list_table
  Future<void> createList(Map<String, dynamic> data) async {
    verifyAuth();
    try {
      final newData = {
        ...data,
        'user_id': userId,
      };
      await supabase.from('list_table').insert(newData).select();
    } on PostgrestException catch (e) {
      throw Exception('Failed to create list: ${e.message}');
    }
  }

  Future<List<Map<String, dynamic>>> readLists() async {
    verifyAuth();
    try {
      final response = await supabase
          .from('list_table')
          .select('id, name')
          .order('id', ascending: true);
      return List<Map<String, dynamic>>.from(response);
    } on PostgrestException catch (e) {
      throw Exception('Failed to read lists: ${e.message}');
    }
  }

  Future<void> deleteList(int id) async {
    verifyAuth();
    try {
      await supabase.from('list_table').delete().eq('id', id).select();
    } on PostgrestException catch (e) {
      throw Exception('Failed to delete list: ${e.message}');
    }
  }

  // CRUD task_table
  Future<void> createTask(Map<String, dynamic> data) async {
    verifyAuth();
    try {
      final newData = {
        ...data,
        'user_id': userId,
      };
      await supabase.from('task_table').insert(newData).select();
    } on PostgrestException catch (e) {
      throw Exception('Failed to create task: ${e.message}');
    }
  }

  Future<List<Map<String, dynamic>>> readTasks(String listName) async {
    verifyAuth();
    try {
      final response = await supabase
          .from('task_table')
          .select(
              'id, list_name, task_name, description_task, date, time, starred')
          .eq('list_name', listName)
          .order('id', ascending: true);
      return List<Map<String, dynamic>>.from(response);
    } on PostgrestException catch (e) {
      throw Exception('Failed to read tasks: ${e.message}');
    }
  }

  Future<List<Map<String, dynamic>>> readStarredTasks() async {
    verifyAuth();
    try {
      final response = await supabase
          .from('task_table')
          .select('id, list_name, task_name, description_task, date, time')
          .eq('starred', true)
          .order('id', ascending: true);
      return List<Map<String, dynamic>>.from(response);
    } on PostgrestException catch (e) {
      throw Exception('Failed to fetch starred tasks: ${e.message} ');
    }
  }

  Future<void> updateTask(int id, Map<String, dynamic> updatedData) async {
    verifyAuth();
    try {
      await supabase
          .from('task_table')
          .update(updatedData)
          .eq('id', id)
          .select();
    } on PostgrestException catch (e) {
      throw Exception('Failed to update task: ${e.message}');
    }
  }

  Future<void> deleteTask(int id) async {
    verifyAuth();
    try {
      await supabase.from('task_table').delete().eq('id', id).select();
    } on PostgrestException catch (e) {
      throw Exception('Failed to delete task: ${e.message}');
    }
  }
}