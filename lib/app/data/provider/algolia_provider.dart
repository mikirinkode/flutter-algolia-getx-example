import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:searchapp/app/data/model/job_model.dart';

class AlgoliaProvider {
  final searcher = HitsSearcher(
    applicationID: '',
    apiKey: '',
    indexName: '',
  );

  Stream<List<JobModel>> searchJobs(String query) {
    debugPrint("searching for: $query");
    searcher.query(query);

    return searcher.responses.map((response) {
      final hits = response.hits;
      final jobs = hits.map((hit) => JobModel.fromMap(hit)).toList();
      debugPrint("search result length: ${jobs.length}");
      return jobs;
    });
  } 
}