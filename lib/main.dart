import 'package:flutter/material.dart';
import './list_of_github.dart';

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
             home: GitHubJobsList(),
        );

    }
}

