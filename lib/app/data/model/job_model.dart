class JobModel {
  String jobName;
  String companyName;

  JobModel({
    required this.jobName,
    required this.companyName,
  });

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      jobName: map['jobName'],
      companyName: map['companyName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobName': jobName,
      'companyName': companyName,
    };
  }
}