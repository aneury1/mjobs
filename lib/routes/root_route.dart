

import 'package:flutter/material.dart';






class RootRoute extends StatefulWidget {
  RootRoute({Key key}) : super(key: key);

  @override
  _RootRouteState createState() => _RootRouteState();
}

class _RootRouteState extends State<RootRoute> {

  getLogoImage(context) async{
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return  Image.asset('assets/images/job_search.png', width: width * 0.50 , height: height * 0.20,);
  }
 
  getFutureBuildLogo(context){
    return FutureBuilder(
      future: getLogoImage(context),
      builder: (context, result){
          if(result.hasError){
            return Placeholder();
          }
          if(result.connectionState == ConnectionState.done && result.hasError==false){
            return result.data; 
          }
          else{
            return Placeholder();
          }

      },
    );
  }


  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
       color: Colors.white,
       child: ListView(
         
         children: <Widget>[

         Container(
           decoration:  BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
           margin: EdgeInsets.only(top:10),
           width:  width * 0.80,
           height: height * 0.30,
           child: getFutureBuildLogo(context),///Image.asset('assets/images/job_search.png', width: width * 0.50 , height: height * 0.20,)
          ) , 

          SizedBox(height: 32.0,),
         /// Center(child:Text( "Mobile Jobs\n\n", style:TextStyle(fontFamily: 'Eroded', fontSize: 24.0, fontWeight: FontWeight.bold,color:Colors.black))),
         
          Container(
          padding: EdgeInsets.only(left:20.43),
          child: 
          Center(child:
          RichText(
            text:TextSpan(
              style:TextStyle(fontSize: 20, color:Colors.black,),
              children:[
                TextSpan(text:"Dev Jobs Sites\n\n", style:TextStyle(fontFamily: 'Eroded', fontSize: 28.0, fontWeight: FontWeight.bold,color:Colors.black) ),
              ]
            )
          ,)
          )
          ),
         
          Container(
          padding: EdgeInsets.only(left:20.43),
          child: 
          Center(child:
          RichText(
            text:TextSpan(
              style:TextStyle(fontSize: 20, color:Colors.black,),
              children:[
                TextSpan(text: "Select one of the option bellow:",style: TextStyle(fontWeight: FontWeight.bold) ),
              ]
            )
          ,)
          )
          ),
           SizedBox(height:10),
         


           GestureDetector(
             onTap: (){
                  Navigator.of(context).pushNamed('/github');
             },
             child: Container(
               width:200.0,
               decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(100,0,0,0), width: 2)),
               margin: EdgeInsets.only(top:20,),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                  ClipRRect( borderRadius: new BorderRadius.circular(80.0), child: Image.asset("assets/images/Octocat.jpg" ,width: 100,height: 100),)
               ],),
           )
           ),///github provider..
 
         
           GestureDetector(
             onTap: (){
                  Navigator.of(context).pushNamed('/stackoverflow');
             },
             child: Container(
               width:200.0,
               decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(100,0,0,0), width: 2)),
               margin: EdgeInsets.only(top:20,),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                  ClipRRect( borderRadius: new BorderRadius.circular(80.0), child: Image.asset("assets/images/so-icon.png" ,width: 100,height: 100),)
               ],),
           )
           ),///github provider..
 
         
         
         
         
         
         
         ],
       )
    );
  }
}