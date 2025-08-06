import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:searchapp/app/data/model/job_model.dart';

class FirebaseProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<JobModel>> getJobs() async {
    try {
      final QuerySnapshot result = await _firestore.collection('aaa_dev_jobs').get();
      debugPrint("job length: ${result.docs.length}");
      final List<JobModel> jobs = result.docs.map((doc) {
        return JobModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return jobs;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
