


import 'package:flutter/material.dart';
import 'models/githubjob.dart';



class GithubJobCard extends StatefulWidget {
 
  final GitHubJob job;
 
  GithubJobCard(this.job,{Key key}) : super(key: key);

  @override
  _GithubJobCardState createState() => _GithubJobCardState();
}

class _GithubJobCardState extends State<GithubJobCard> {

  
  createTitleCompany(context){
     String text =  widget.job.company.length>32?widget.job.company.substring(0,32):widget.job.company;

     return 
     Padding(
     padding: EdgeInsets.all(6.0),
     child:Container(
       width: MediaQuery.of(context).size.width * 0.90,
       height: 120 * 0.20 ,
       ///color: Colors.red,
       child:Row
       (
         children: <Widget>[
           Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,))
         ],
       )
     )
     );
  }
  

  createCompanyDetail(context)=>Container();

  createApplicationBottom(context) => Container();

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.all(10.0),
       child: Container(
         width: MediaQuery.of(context).size.width * 0.98,
         height: 180.0,
         decoration: BoxDecoration(
           color: Colors.yellowAccent,
           borderRadius: BorderRadius.circular(20.0)),
         child: 
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                       createTitleCompany(context),
                        createCompanyDetail(context),
                        createApplicationBottom(context),
                      // Text(widget.job.company, overflow: TextOverflow.clip,),
                      // Text("Date of publication: ", overflow: TextOverflow.clip,), 
                 ],)
         
         ,
       ),
    );
  }
}