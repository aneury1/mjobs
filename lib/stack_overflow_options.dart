import 'package:flutter/material.dart';

class StackOverflowQuery {
  String location;
}

class StackOverFlowSelector extends StatefulWidget {
  StackOverFlowSelector({Key key}) : super(key: key);

  @override
  _StackOverFlowSelectorState createState() => _StackOverFlowSelectorState();
}

class _StackOverFlowSelectorState extends State<StackOverFlowSelector> {
  StackOverflowQuery query;
  TextEditingController location_controller;
  TextEditingController range_controller;
  TextEditingController number_controller;

  @override
  void initState() {
    print("init state?");
    range_controller = TextEditingController();
    location_controller = TextEditingController();
    location_controller.addListener(() => {print(location_controller.text)});
    query = StackOverflowQuery();
    super.initState();
  }

  getTextFieldLocation(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0,),
        Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Location : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            )),
             SizedBox(height: 10.0,),
        Padding(
            
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 233, 238, 240), borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.only(top: 5.0, left:10, right: 10.0, bottom: 5.0),
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextFormField(
                  style: TextStyle(fontSize: 22.0),
                  decoration: InputDecoration(border: InputBorder.none,focusColor: Colors.redAccent),
                  controller: location_controller,
                )))
      ],
    );
  }


  getTextFieldRange(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0,),
        Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Range : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            )),
             SizedBox(height: 10.0,),
        Padding(
            
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 233, 238, 240), borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.only(top: 5.0, left:10, right: 10.0, bottom: 5.0),
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextFormField(
                  style: TextStyle(fontSize: 22.0),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: InputBorder.none,focusColor: Colors.redAccent),
                  controller: range_controller,
                )))
      ],
    );
  }


  getTextFieldQuantityReturned(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0,),
        Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Number of response from query : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
             SizedBox(height: 10.0,),
        Padding(
            
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 233, 238, 240), borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.only(top: 5.0, left:10, right: 10.0, bottom: 5.0),
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextFormField(
                  style: TextStyle(fontSize: 22.0),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: InputBorder.none,focusColor: Colors.redAccent),
                  controller: number_controller,
                )))
      ],
    );
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              color: Color.fromARGB(255, 242, 198, 36),
              height: MediaQuery.of(context).size.height * 0.32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/so-icon.png',
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: MediaQuery.of(context).size.height * 0.32,
                  )
                ],
              )),
          getTextFieldLocation(context),
           getTextFieldRange(context),
          ///getTextFieldQuantityReturned(context),
 
             SizedBox(height: 20.0,)
        ],
      ),
    );
  }
}
