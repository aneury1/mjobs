import 'package:flutter/material.dart';
import 'package:mjobs/stack_overflow_options.dart';
import './list_of_github.dart';

import './routes/root_route.dart';
import './routes/router_details_git.dart';
import 'list_of_stackoverflow.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  

    @override
    build(BuildContext context){
        
        return MaterialApp(
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
                 backgroundColor: Color.fromARGB(255,0x43,0x43,0x43),
                 primaryColor: Colors.amber
             ),
            /// home: RootRoute(), ///GitHubJobsList(),
             routes: <String, WidgetBuilder>{
                '/' : (context) => RootRoute(),
                '/github' : (context)=>GitHubJobsList(),
                '/detailgithub': (context)=>GithubJobDetail(),
                '/stackoverflow' : (context)=>StackOverFlowSelector(),
                '/list-stackoverflow': (context)=>ListOfStackOverFlowJobs(),
             },
             initialRoute: '/',



        );

    }
}

