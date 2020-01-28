

import 'package:flutter/material.dart';

import '../models/githubjob.dart';


class GithubJobDetail extends StatefulWidget {
  GithubJobDetail({Key key}) : super(key: key);

  @override
  _GithubJobDetailState createState() => _GithubJobDetailState();
}

class _GithubJobDetailState extends State<GithubJobDetail> {
  
  
  GitHubJob job;
  
  getListJob(context){
    
    Image im = Image.network(job.company_logo);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color.fromARGB(255, 2, 2, 54),
          centerTitle: true,
          title: Text(job.company, style: TextStyle(color:Colors.white),),
          pinned: true,
          floating: true,
          expandedHeight: im==null?0:200,
          flexibleSpace: im,
        ),
        SliverList(
          
          delegate: SliverChildBuilderDelegate(
         (context, index)=> Container(height:100,margin: EdgeInsets.only(top:10, bottom: 10),color: Colors.red,),
          childCount: 10,
        ),
        ),

      ],
    );
  }
  
  
  @override
  Widget build(BuildContext context) { 
    job = ModalRoute.of(context).settings.arguments;
    return Scaffold(
       body: getListJob(context),
    );
  }
}
