import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        brightness: Brightness.light 
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   bool isMobile = MediaQuery.of(context).size.width < 700; 
    return Scaffold(
      appBar: isMobile ? AppBar(): null,
      drawer: isMobile ? Drawer(child: Menu()): null,
      body: Row(
        children: <Widget>[
          isMobile ? Container(): Drawer(
          child: Menu(),),
          Expanded(child: FlatButton(child: Text('Page'), onPressed: () { 
            showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text('Page 1'),
              actions: <Widget>[
                FloatingActionButton(child: Text('OK'), onPressed: () {
                  Navigator.pop(context);
                },)
              ],
              );
            },);
      },),)
      ],),
    );
  }
}
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    return Scaffold(
    appBar: isMobile ? AppBar(): null,
    drawer: isMobile ? Drawer(child: Menu()): null,
    body:Row(
      children: <Widget>[
        isMobile ? Container(): Drawer(child: Menu(),),
      Expanded(child: FlatButton(child: Text('Page'), onPressed: () { 
        showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Page 2'),
          actions: <Widget>[
            FloatingActionButton(child: Text('OK'), onPressed: () {
              Navigator.pop(context);
            },)
          ],
          );
        },);
      },) )
    ],) ,
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
         child: ListView(children: <Widget>[
        ListTile(
          title: Text('Page I'),
          leading: Icon(Icons.pageview),
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page1()));
          },
        ),
        ListTile(
          title: Text('Page II'),
          leading: Icon(Icons.pageview),
           onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page2()));
          },
        ),
        ListTile(
          title: Text('Brightness'),
          leading: Icon(Icons.brightness_1),
           onTap: (){

          },
        )
         ],),
      ),
    );
  }
}
