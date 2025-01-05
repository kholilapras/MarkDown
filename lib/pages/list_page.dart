import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/controllers/auth/auth_google.dart';
import 'package:tasks/pages/new_list_page.dart';
import 'package:tasks/pages/settings_page.dart';
import 'package:tasks/pages/create_new_task_page.dart';
import 'package:tasks/pages/detail_task_page.dart';
import 'package:tasks/controllers/supabase/supabase_controller.dart';
import 'package:tasks/controllers/themes/theme_style.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with TickerProviderStateMixin {
  late TabController tabController;
  final AuthController authController = Get.find<AuthController>();
  final SupabaseController supabaseController = Get.put(SupabaseController());

  @override
  void initState() {
    super.initState();
    supabaseController.fetchLists();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final dynamicTabsCount = supabaseController.listData.length;
      final totalTabs = 2 + dynamicTabsCount;

      tabController = TabController(length: totalTabs, vsync: this);

      return DefaultTabController(
        length: totalTabs,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tasks', style: bodyText18),
            actions: [
              Obx(() {
                return authController.photoUrl.value != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => SettingsPage());
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                NetworkImage(authController.photoUrl.value!),
                          ),
                        ),
                      )
                    : IconButton(
                        icon: const Icon(Icons.account_circle, size: 36),
                        onPressed: () {
                          Get.to(() => SettingsPage());
                        },
                      );
              }),
            ],
            bottom: TabBar(
              controller: tabController,
              isScrollable: true,
              tabs: [
                const Tab(icon: Icon(Icons.star)), // Tab pertama
                ...supabaseController.listData.map((item) {
                  return Tab(
                    text: item['name'],
                  );
                }),
                const Tab(text: '+ New List'), // Tab terakhir
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // Tab pertama (Starred tasks)
              Obx(() {
                supabaseController.fetchStarredTasks();
                if (supabaseController.starredTaskData.isEmpty) {
                  return const Center(
                      child: Text('No favorite tasks found.',
                          style: bodyText16));
                }
                return ListView.builder(
                  itemCount: supabaseController.starredTaskData.length,
                  itemBuilder: (context, index) {
                    final task = supabaseController.starredTaskData[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            task['task_name'],
                            style: bodyText18.copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(task['description_task'] ?? '',
                                  style: bodyText16),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text('${task['date'] ?? 'N/A'}',
                                      style: bodyText12),
                                  Text('  |  ${task['time'] ?? 'N/A'}',
                                      style: bodyText12),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            Get.to(() => DetailTaskPage(task: task));
                          },
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Delete Task',
                                        style: bodyText18),
                                    content: const Text(
                                        'Are you sure you want to delete this task?',
                                        style: bodyText16),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel',
                                            style: buttonText20),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          supabaseController.deleteTask(
                                              task['id'], 'Starred');
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Delete',
                                            style: buttonText20),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),

              // Tab tengah
              ...supabaseController.listData.map((item) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            item['name'],
                            style: bodyText16,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Delete Confirmation',
                                        style: bodyText18),
                                    content: const Text(
                                        'Are you sure you want to delete this list?',
                                        style: bodyText16),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel',
                                            style: buttonText20),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          supabaseController
                                              .deleteList(item['id']);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Delete',
                                            style: buttonText20),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Obx(() {
                      supabaseController.fetchTasks(item['name']);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          child: Column(
                            children: supabaseController.taskData.map((task) {
                              return ListTile(
                                title: Text(
                                  task['task_name'],
                                  style: bodyText18.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(task['description_task'] ?? '',
                                        style: bodyText16),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text('${task['date'] ?? 'N/A'}',
                                            style: bodyText12),
                                        Text('  |  ${task['time'] ?? 'N/A'}',
                                            style: bodyText12),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Get.to(() => DetailTaskPage(task: task));
                                },
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Delete Task',
                                              style: bodyText18),
                                          content: const Text(
                                              'Are you sure you want to delete this task?',
                                              style: bodyText16),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel',
                                                  style: buttonText20),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                supabaseController.deleteTask(
                                                    task['id'], item['name']);
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Delete',
                                                  style: buttonText20),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }),
                  ],
                );
              }),

              // Tab terakhir
              Builder(
                builder: (context) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (tabController.index == totalTabs - 1) {
                      Future.microtask(() {
                        Get.to(() => NewListPage());
                        tabController.index = 0;
                      });
                    }
                  });
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => CreateNewTasksPage());
            },
            child: const Icon(Icons.add),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
