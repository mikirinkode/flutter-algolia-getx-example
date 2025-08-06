import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchapp/app/data/model/job_model.dart';
import 'package:searchapp/app/data/provider/algolia_provider.dart';
import 'package:searchapp/app/data/provider/firebase_provider.dart';

class HomeController extends GetxController {

  // Jobs
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  final jobs = <JobModel>[].obs;
  final isLoading = false.obs;

  // Search
  final AlgoliaProvider _algoliaProvider = AlgoliaProvider();
  final searchController = TextEditingController();
  
  @override
  void onInit() {
    super.onInit();

    // Load jobs
    isLoading.value = true;
    _firebaseProvider.getJobs().then((value) {
      debugPrint("job length: ${value.length}");
      jobs.value = value;
      isLoading.value = false;
    });

    // Search
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        isLoading.value = true;
        _algoliaProvider.searchJobs(searchController.text).listen((value) {
          debugPrint("homecontroller: search result length: ${value.length}");
          jobs.value = value;
          isLoading.value = false;
        });
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

}
