import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crazy Switch",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crazy Switch"),
      ),
      body: Container(
        child: Center(
          child: CrazySwitch(),
        ),
      ),
    );
  }
}

class CrazySwitch extends StatefulWidget {
  @override
  _CrazySwitchState createState() => _CrazySwitchState();
}

class _CrazySwitchState extends State<CrazySwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      padding: EdgeInsets.fromLTRB(2, 8, 2, 8),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
