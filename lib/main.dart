import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class _CrazySwitchState extends
  State<CrazySwitch> with
  SingleTickerProviderStateMixin{

  Duration _duration = Duration(milliseconds: 1500);
  Animation<Alignment> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration
    );

    _animation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight
    ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.linear
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
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
            alignment: _animation.value,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  if(_animationController.isCompleted){
                    _animationController.reverse();
                  }else{
                    _animationController.forward();
                  }
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
