

import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListOfStackOverFlowJobs extends StatefulWidget {
  ListOfStackOverFlowJobs({Key key}) : super(key: key);

  @override
  _ListOfStackOverFlowJobsState createState() => _ListOfStackOverFlowJobsState();
}

class _ListOfStackOverFlowJobsState extends State<ListOfStackOverFlowJobs> {
 

  



  Future<dynamic> getStackXML()async{
    print("stackoverflow print?");
    var result = await http.get('https://stackoverflow.com/jobs/feed');
    print(result.body);
    return result.body;
  }
 

 _getFutureList(context){
    
    dynamic future = null;
    try{
    future = FutureBuilder(
        
        future:  getStackXML(),
        builder: (context, result){
         if(result.hasError){
           return  Center(child:Text("there is an error loading the data.",style:TextStyle(fontFamily: 'Eroded', fontSize: 28.0, fontWeight: FontWeight.bold,color:Colors.black)));
         }
        if(result.connectionState == ConnectionState.waiting)
           {
                 return Center(child:Text("Waiting for data...",style:TextStyle(fontFamily: 'Eroded', fontSize: 28.0, fontWeight: FontWeight.bold,color:Colors.black)));
           }
         if(result.connectionState== ConnectionState.active){
             return Text("Waiting for data...",style:TextStyle(fontFamily: 'Eroded', fontSize: 28.0, fontWeight: FontWeight.bold,color:Colors.black));
           }
        
        if (result.connectionState == ConnectionState.none &&
            result.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        
          ///dynamic json = jsonDecode(result.data);
          ///var len = json.length;
          return Text("StackOverflow data;",style:TextStyle(fontFamily: 'Eroded', fontSize: 28.0, fontWeight: FontWeight.bold,color:Colors.black)) ;
        });
    }catch(xd){
       print(xd);
    }
    return future;
 }


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getFutureList(context));
  }
}