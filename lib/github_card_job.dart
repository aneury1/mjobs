


import 'package:flutter/material.dart';
import 'models/githubjob.dart';



class GithubJobCard extends StatefulWidget {
 
  final GitHubJob job;
 
  GithubJobCard(this.job,{Key key}) : super(key: key);

  @override
  _GithubJobCardState createState() => _GithubJobCardState();
}

class _GithubJobCardState extends State<GithubJobCard> {

  
  getImageByValidURL(context , url){
    if(url) return Image.network(url,width:64,height: 64, );
    else  return Container();
     
  }

  createTitleCompany(context)
  {
     String text =  widget.job.company.length>32?widget.job.company.substring(0,32):widget.job.company;
    
     return 
     Padding(
     padding: EdgeInsets.all(6.0),
     child:Container(
       width: MediaQuery.of(context).size.width * 0.90,
      
       ///color: Colors.red,
       child:Row
       (
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
          Flexible(child: Padding(padding: EdgeInsets.only(left:10, top:20),child:Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21,))),
           /// getImageByValidURL(context , widget.job.company_logo)
          )],
       )
     )
     );
  }
  

  createCompanyDetail(context){
     String text =  widget.job.title;
     String text2 =  widget.job.location.toString();
     if(text.length > 48)
        text = text.substring(0, 38);
   

     return  Container(
       width: MediaQuery.of(context).size.width * 0.90,
      
       ///color: Colors.red,
       child:Column
       (
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Padding(padding: EdgeInsets.only(left:15, top:5),child:Text(text,overflow: TextOverflow.clip, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
           Padding(padding: EdgeInsets.only(left:15, top:2),child:Text(text2,overflow: TextOverflow.clip, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))),
           
         ],
       )
     )
      ;

  }

  createApplicationBottom(context) => Container();

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.all(10.0),
       child: Container(
         width: MediaQuery.of(context).size.width * 0.98,
         height: 180.0,
         decoration: BoxDecoration(
           color: Colors.white10,
           borderRadius: BorderRadius.circular(20.0),
           border: Border.all(color:Color.fromARGB(255, 0, 0, 0),width: 1)
           ),
           
         child: 
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                       createTitleCompany(context),
                        createCompanyDetail(context),
                        createApplicationBottom(context),
  
                 ],)
         
         ,
       ),
    );
  }
}