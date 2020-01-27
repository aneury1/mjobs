import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mjobs/models/githubjob.dart';
import 'package:http/http.dart' as http;

import 'github_card_job.dart';

class GitHubJobsList extends StatefulWidget {
  GitHubJobsList({Key key}) : super(key: key);

  @override
  _GitHubJobsListState createState() => _GitHubJobsListState();
}

class _GitHubJobsListState extends State<GitHubJobsList> {
  Future<GitHubJob> jobs;

  @override
  void initState() {
    jobs = fetchJobs();

    super.initState();
  }

  Future fetchJobs() async {
    var result = await http.get('https://jobs.github.com/positions.json');
    ///print(result.body);
    return json.decode(result.body);
  }

  Widget GithubJobWidget() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        return ListView.builder(
          itemCount: projectSnap.data.length,
          itemBuilder: (context, index) {
            GitHubJob project = GitHubJob.fromJson(projectSnap.data[index]);
            return GithubJobCard(project);
          },
        );
      },
      future: fetchJobs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('GitHubTest?'),
      ),*/
      body:
       GithubJobWidget(),
    );
  }
}
