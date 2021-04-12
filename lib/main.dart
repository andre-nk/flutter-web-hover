// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController control;

  Animation<double> rot;
  Animation<double> traslX;
  Animation<double> traslY;
  bool isHovering = false;

  @override
  void initState() {
    super.initState();

    control = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );

    traslX = Tween<double>(
      begin: 0,
      end: 10,
    ).animate(control);

    traslY = Tween<double>(
      begin: 0,
      end: -10,
    ).animate(control);

    // control.forward().then((val){
    //   control.reverse();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: Column(
        children: [
          Expanded(
            child:
              AnimatedBuilder(
                animation: control,
                builder: (_, child){
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        top: 100,
                        left: 20,
                        child: Transform.translate(
                          offset: Offset(-1 * traslX.value, -1 * traslY.value),
                            child: Material(
                              child: InkWell(
                                splashColor: Color(0xff10162F),
                                onTap: () => null,
                                onHover: (hovering) {
                                  if(hovering){
                                    control.forward();
                                  } else {
                                    control.reverse();
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.ease,
                                  padding: EdgeInsets.all(45),
                                  decoration: BoxDecoration(
                                    color: Color(0xff10162F),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  width: 200,
                                  child: const Text(
                                    '',
                                    style: TextStyle(fontSize: 90, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 100,
                        left: 20,
                        child: Transform.translate(
                          offset: Offset(traslX.value, traslY.value),
                            child: Material(
                              child: InkWell(
                                splashColor: Color(0xff10162F),
                                onTap: () => null,
                                onHover: (hovering) {
                                  if(hovering){
                                    control.forward();
                                  } else {
                                    control.reverse();
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.ease,
                                  padding: EdgeInsets.all(45),
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFD300),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  width: 200,
                                  child: const Text(
                                    'ab',
                                    style: TextStyle(fontSize: 90, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),   
                    ]
                  );
                }
              ),
            
          ),
          Expanded(
            child:
              AnimatedBuilder(
                animation: control,
                builder: (_, child){
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        top: 100,
                        left: 20,
                        child: Transform.translate(
                          offset: Offset(-1 * traslX.value, -1 * traslY.value),
                            child: Material(
                              child: InkWell(
                                splashColor: Color(0xff10162F),
                                onTap: () => null,
                                onHover: (hovering) {
                                  if(hovering){
                                    control.forward();
                                  } else {
                                    control.reverse();
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.ease,
                                  padding: EdgeInsets.all(45),
                                  decoration: BoxDecoration(
                                    color: Color(0xff10162F),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  width: 200,
                                  child: const Text(
                                    '',
                                    style: TextStyle(fontSize: 90, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 100,
                        left: 20,
                        child: Transform.translate(
                          offset: Offset(traslX.value, traslY.value),
                            child: Material(
                              child: InkWell(
                                splashColor: Color(0xff10162F),
                                onTap: () => null,
                                onHover: (hovering) {
                                  if(hovering){
                                    control.forward();
                                  } else {
                                    control.reverse();
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.ease,
                                  padding: EdgeInsets.all(45),
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFD300),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  width: 200,
                                  child: const Text(
                                    'ab',
                                    style: TextStyle(fontSize: 90, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),   
                    ]
                  );
                }
              ),
            
          ),
        ],
      ),
    );
  }
}
