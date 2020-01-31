

import 'package:flutter/material.dart';

class StackOverFlowSelector extends StatefulWidget {
  StackOverFlowSelector({Key key}) : super(key: key);

  @override
  _StackOverFlowSelectorState createState() => _StackOverFlowSelectorState();
}

class _StackOverFlowSelectorState extends State<StackOverFlowSelector> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
    body:Column(
          children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Image.asset('assets/images/so-icon.png')],
                  )


          ],
    ),);
  }
}