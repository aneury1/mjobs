

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

          SizedBox(height: 64.0,),
          Container(
          padding: EdgeInsets.only(left:20.43, top:10.0),
          child: 
          Center(child:
          RichText(
            text:TextSpan(
              style:TextStyle(fontSize: 20, color:Colors.black,),
              children:[
                TextSpan(text: "Launch your", ),
                TextSpan(text: " Dream Job "   , style: TextStyle(fontWeight: FontWeight.bold)  ),
                TextSpan(text: " !! "          , style: TextStyle(fontWeight: FontWeight.w500, color:Colors.blueAccent, fontSize: 23)  ),
                TextSpan(text: " With US"          , style: TextStyle(fontSize  :30.0,fontWeight: FontWeight.bold, color:Colors.blueGrey,)  ),
                TextSpan(text: " Please use this app to find it:"          , style: TextStyle(fontSize  :30.0,fontWeight: FontWeight.bold, color:Colors.black87,)  ),
                 TextSpan(text:"\n\n use the option bellow in order to find it."          , style: TextStyle(fontSize :14.0,fontWeight: FontWeight.bold, color:Colors.black,)  ),
              ]
            )
          ,)
          )
          ),
           SizedBox(height:10),
 
         
         ],
       )
    );
  }
}