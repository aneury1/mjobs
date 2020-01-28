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
 
  @override
  void initState() {
  
    super.initState();
  }

  Future<dynamic> fetchJobs() async {
    var result = await http.get('https://jobs.github.com/positions.json');
    print(result.body);
    return result.body;
  }

  getListOfFuture(){

     var future = null;
     try{
        future = FutureBuilder(
        builder: (context, result) {
        
         if(result.hasError){
           return  Center(child:Text("Waiting for data..."));
         }
        if(result.connectionState == ConnectionState.waiting)
           {
                 return Center(child:Text("Waiting for data..."));
           }
         if(result.connectionState== ConnectionState.active){
             return Text("Waiting for data...");
           }
        
        if (result.connectionState == ConnectionState.none &&
            result.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        
          dynamic json = jsonDecode(result.data);
          var len = json.length;

          return 


          ListView.builder(
          itemCount: len,
          itemBuilder: (context, index) {
            GitHubJob project = GitHubJob.fromJson(json[index]);
            return GithubJobCard(project);
          },
        );
       
      },
      future: fetchJobs(),
    );
     }catch(ex){
        future = Text("Invalid Future");
     }
     finally{
       return future;
     }
  }


  Widget githubJobWidget() {
    return  
     Stack(
       children: <Widget>[
            getListOfFuture(),
           //// Positioned(bottom: 100,child: Container(child:Text("Reload"),color:Colors.red),)
       ]
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('GitHubTest?'),
      ),*/
      body:
       githubJobWidget(),
    );
  }
}
