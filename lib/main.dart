// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController control;

  Animation<double> rot;
  Animation<double> traslX;
  Animation<double> traslY;
  bool isHovering = false;
  bool isFormActive = false;
  List<AnimatedText> animatedText = [
    TypewriterAnimatedText('Discipline is the best tool'),
    TypewriterAnimatedText('Design first, then code'),
    TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
    TypewriterAnimatedText('Do not test bugs out, design them out'),
  ];
  TextEditingController formController = TextEditingController();

  @override
  void initState() {
    super.initState();

    control = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );

    traslX = Tween<double>(
      begin: 0,
      end: 5,
    ).animate(control);

    traslY = Tween<double>(
      begin: 0,
      end: -5,
    ).animate(control);

    // control.forward().then((val){
    //   control.reverse();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            SizedBox(
              width: 1000.0,
              child: isFormActive
                ? TextField(
                    controller: formController,
                    autofocus: true,
                    onEditingComplete: (){
                      setState(() {
                        isFormActive = false; 
                        formController.clear();                     
                      });
                    },
                    onChanged: (str){
                      if(formController.text.indexOf("_") == -1){
                        setState(() {
                          formController.text += "_";
                          formController.selection = TextSelection.fromPosition(TextPosition(offset: formController.text.length - 1));
                        });
                      } else {
                        
                      }
                      // if("_".allMatches(formController.text).length > 1 && formController.text != ""){
                      //   print("_".allMatches(formController.text).first);
                      //   formController.text.replaceRange(
                      //     formController.text.lastIndexOf("_"),
                      //     formController.text.lastIndexOf("_") + 1,
                      //     ""
                      //   );
                      // } else {
                      //   print("a");
                      //   formController.text += "_";
                      // }
                    },
                    decoration: InputDecoration(
                      labelText: "a"
                    ),
                  )
                : DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Agne',
                    ),
                    child: AnimatedTextKit(
                      onNext: (index, bool){
                        print(animatedText[index].toString());
                      },
                      pause: Duration(seconds: 5),
                      animatedTexts: animatedText,
                      onTap: () {
                        setState(() {
                          isFormActive = true;                        
                        });
                      },
                    ),
                  ),
                
            )
          ],
        ),
      ),
    );
  }
}
