import 'package:flutter/material.dart';

import '../models/githubjob.dart';

class GithubJobDetail extends StatefulWidget {
  GithubJobDetail({Key key}) : super(key: key);

  @override
  _GithubJobDetailState createState() => _GithubJobDetailState();
}

class _GithubJobDetailState extends State<GithubJobDetail> {
  GitHubJob job;

  getEntryJobTitle(context){
      return 
      SizedBox(
                height: 100, child: 
                Center( child:Text(job.company.toString(), style:TextStyle(fontSize: 24.0, fontWeight:FontWeight.bold))));
  }

  getJobTitleAndLocation(context){
     return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       
       children:[
             Container(width: MediaQuery.of(context).size.width,height:48.01, child:Center(child:Text(job.title,style:TextStyle(fontSize: 20.0, fontWeight:FontWeight.bold)))),
             
     ]
     );

  }

  getListJob(context) {
    Image im = Image.network(job.company_logo);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color.fromARGB(255, 2, 2, 54),
          centerTitle: true,
          title: Text(
            " ",
            style: TextStyle(color: Colors.white),
          ),
          pinned: true,
          floating: true,
          expandedHeight: im == null ? 0 : 200,
          flexibleSpace: Container(
            margin: EdgeInsets.all(10),
            child: im,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              switch (index) {
                case 0: return getEntryJobTitle(context);break;
                case 1: return getJobTitleAndLocation(context);
                default:
                  return SizedBox(height: 100, child: Text(index.toString()));
              }
            },
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
