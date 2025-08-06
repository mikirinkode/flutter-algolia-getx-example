import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Column(
        spacing: 16,
        children: [
          TextField(
            controller: controller.searchController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search jobs...',
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: controller.jobs.length,
                    itemBuilder: (context, index) {
                      final job = controller.jobs[index];
                      return ListTile(
                        title: Text(job.jobName),
                        subtitle: Text(job.companyName),
                      );
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
