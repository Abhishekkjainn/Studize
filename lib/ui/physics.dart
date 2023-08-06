import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:studize/ui/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

double pmarks=0;
class physics_syllabus extends StatefulWidget {
  const physics_syllabus({Key? key}) : super(key: key);

  @override
  State<physics_syllabus> createState() => _physics_syllabusState();
}

class _physics_syllabusState extends State<physics_syllabus> {
  late bool Switch1;
  late bool Switch2;
  late bool Switch3;
  late bool Switch4;
  late bool Switch5;
  late bool Switch6;
  late bool Switch7;
  late bool Switch8;
  late bool Switch9;
  late bool Switch10;
  late bool Switch11;
  late bool Switch12;
  late bool Switch13;
  late bool Switch14;
  late bool Switch15;
  late bool Switch16;
  late bool Switch17;
  late bool Switch18;
  late bool Switch19;
  late bool Switch20;


  @override
  void initState() {
    super.initState();
    Switch1 = false;
    Switch2 = false;
    Switch3 = false;
    Switch4 = false;
    Switch5 = false;
    Switch6 = false;
    Switch7 = false;
    Switch8 = false;
    Switch9 = false;
    Switch10= false;
    Switch11 = false;
    Switch12 = false;
    Switch13 = false;
    Switch14 = false;
    Switch15 = false;
    Switch16 = false;
    Switch17 = false;
    Switch18 = false;
    Switch19 = false;
    Switch20 = false;
    loadToggleSwitchState();
  }

  void loadToggleSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool storedValue1 = prefs.getBool('physicsToggleSwitch1') ?? false;
    bool storedValue2 = prefs.getBool('physicsToggleSwitch2') ?? false;
    bool storedValue3 = prefs.getBool('physicsToggleSwitch3') ?? false;
    bool storedValue4 = prefs.getBool('physicsToggleSwitch4') ?? false;
    bool storedValue5 = prefs.getBool('physicsToggleSwitch5') ?? false;
    bool storedValue6 = prefs.getBool('physicsToggleSwitch6') ?? false;
    bool storedValue7 = prefs.getBool('physicsToggleSwitch7') ?? false;
    bool storedValue8 = prefs.getBool('physicsToggleSwitch8') ?? false;
    bool storedValue9 = prefs.getBool('physicsToggleSwitch9') ?? false;
    bool storedValue10 = prefs.getBool('physicsToggleSwitch10') ?? false;
    bool storedValue11 = prefs.getBool('physicsToggleSwitch11') ?? false;
    bool storedValue12 = prefs.getBool('physicsToggleSwitch12') ?? false;
    bool storedValue13 = prefs.getBool('physicsToggleSwitch13') ?? false;
    bool storedValue14 = prefs.getBool('physicsToggleSwitch14') ?? false;
    bool storedValue15 = prefs.getBool('physicsToggleSwitch15') ?? false;
    bool storedValue16 = prefs.getBool('physicsToggleSwitch16') ?? false;
    bool storedValue17 = prefs.getBool('physicsToggleSwitch17') ?? false;
    bool storedValue18 = prefs.getBool('physicsToggleSwitch18') ?? false;
    bool storedValue19 = prefs.getBool('physicsToggleSwitch19') ?? false;
    bool storedValue20 = prefs.getBool('physicsToggleSwitch20') ?? false;
    setState(() {
      Switch1 = storedValue1;
      Switch2 = storedValue2;
      Switch3 = storedValue3;
      Switch4 = storedValue4;
      Switch5 = storedValue5;
      Switch6 = storedValue6;
      Switch7 = storedValue7;
      Switch8 = storedValue8;
      Switch9 = storedValue9;
      Switch10 = storedValue10;
      Switch11 = storedValue11;
      Switch12 = storedValue12;
      Switch13 = storedValue13;
      Switch14 = storedValue14;
      Switch15 = storedValue15;
      Switch16 = storedValue16;
      Switch17 = storedValue17;
      Switch18 = storedValue18;
      Switch19 = storedValue19;
      Switch20 = storedValue20;

    });
  }

  void saveToggleSwitchState1(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch1', newValue);
  }

  void saveToggleSwitchState2(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch2', newValue);
  }
  void saveToggleSwitchState3(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch3', newValue);
  }
  void saveToggleSwitchState4(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch4', newValue);
  }
  void saveToggleSwitchState5(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch5', newValue);
  }
  void saveToggleSwitchState6(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch6', newValue);
  }
  void saveToggleSwitchState7(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch7', newValue);
  }
  void saveToggleSwitchState8(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch8', newValue);
  }
  void saveToggleSwitchState9(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch9', newValue);
  }
  void saveToggleSwitchState10(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch10', newValue);
  }
  void saveToggleSwitchState11(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch11', newValue);
  }

  void saveToggleSwitchState12(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch12', newValue);
  }
  void saveToggleSwitchState13(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch13', newValue);
  }
  void saveToggleSwitchState14(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch14', newValue);
  }
  void saveToggleSwitchState15(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch15', newValue);
  }
  void saveToggleSwitchState16(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch16', newValue);
  }
  void saveToggleSwitchState17(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch17', newValue);
  }
  void saveToggleSwitchState18(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch18', newValue);
  }
  void saveToggleSwitchState19(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch19', newValue);
  }
  void saveToggleSwitchState20(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('physicsToggleSwitch20', newValue);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
    int i;
    int j;
    int k;
    int l;
    int m;
    int n;
    int o;
    int p;
    int q;
    int r;
    int s;
    int t;
    if(Switch1)
    {
      a=1;
    } else
    {
      a=0;
    }
    if(Switch2)
    {
      b=1;
    } else
    {
      b=0;
    }
    if(Switch3)
    {
      c=1;
    } else
    {
      c=0;
    }
    if(Switch4)
    {
      d=1;
    } else
    {
      d=0;
    }
    if(Switch5)
    {
      e=1;
    } else
    {
      e=0;
    }
    if(Switch6)
    {
      f=1;
    } else
    {
      f=0;
    }
    if(Switch7)
    {
      g=1;
    } else
    {
      g=0;
    }
    if(Switch8)
    {
      h=1;
    } else
    {
      h=0;
    }
    if(Switch9)
    {
      i=1;
    } else
    {
      i=0;
    }
    if(Switch10)
    {
      j=1;
    } else
    {
      j=0;
    }
    if(Switch11)
    {
      k=1;
    } else
    {
      k=0;
    }
    if(Switch12)
    {
      l=1;
    } else
    {
      l=0;
    }
    if(Switch13)
    {
      m=1;
    } else
    {
      m=0;
    }
    if(Switch14)
    {
      n=1;
    } else
    {
      n=0;
    }
    if(Switch15)
    {
      o=1;
    } else
    {
      o=0;
    }
    if(Switch16)
    {
      p=1;
    } else
    {
      p=0;
    }
    if(Switch17)
    {
      q=1;
    } else
    {
      q=0;
    }
    if(Switch18)
    {
      r=1;
    } else
    {
      r=0;
    }
    if(Switch19)
    {
      s=1;
    } else
    {
      s=0;
    }
    if(Switch20)
    {
      t=1;
    } else
    {
      t=0;
    }
    pmarks=(((a)+(b)+(c)+(d)+(e)+(f)+(g)+(h)+(i)+(j)+(k)+(l)+(m)+(n)+(o)+(p)+(q)+(r)+(s)+(t))*100)/20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Physics Syllabus",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: screenWidth*0.07,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        padding: EdgeInsets.all(screenHeight*0.005),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(

              margin: EdgeInsets.all(screenHeight*0.005),
              height: screenHeight*0.250,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(screenHeight*0.010),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              Text(
                                "Physics\nCourse Covered",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth*0.05,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(screenHeight*0.010),
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            interval: 10,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startValue: 0,
                                endValue: 12,
                                color: Colors.red.shade900,
                              ),
                              GaugeRange(
                                startValue: 12,
                                endValue: 24,
                                color: Colors.red.shade700,
                              ),
                              GaugeRange(
                                startValue: 24,
                                endValue: 36,
                                color: Colors.red.shade500,
                              ),
                              GaugeRange(
                                startValue: 36,
                                endValue: 48,
                                color: Colors.orange.shade600,
                              ),
                              GaugeRange(
                                startValue: 48,
                                endValue: 60,
                                color: Colors.green.shade200,
                              ),
                              GaugeRange(
                                startValue: 60,
                                endValue: 72,
                                color: Colors.green.shade400,
                              ),
                              GaugeRange(
                                startValue: 72,
                                endValue: 84,
                                color: Colors.green.shade600,
                              ),
                              GaugeRange(
                                startValue: 84,
                                endValue: 100,
                                color: Colors.green.shade900,
                              ),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: pmarks.toDouble(),
                                enableAnimation: true,
                                needleColor: Colors.lightGreen,
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                widget: Container(
                                  child: Text(
                                    '${pmarks.toStringAsFixed(2)} %',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                ),
                                angle: 90,
                                positionFactor: 0.5,
                              ),
                            ],
                          ),
                        ],


                      ),



                    ),

                  )
                ],
              ),


            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(screenHeight*0.005),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Physics and\nMeasurement",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch1 = !Switch1;
                        print("$a");
                      });
                      saveToggleSwitchState1(Switch1);
                    },
                    initialLabelIndex: Switch1 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Kinematics",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch2 = !Switch2;
                      });
                      saveToggleSwitchState2(Switch2);
                    },
                    initialLabelIndex: Switch2 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
        Container(
          width: screenWidth,
          height: screenHeight*0.08,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.grey.shade900,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width:screenWidth*0.556,
                child: Center(
                  child: Text(
                    "Laws of Motion",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth*0.032,
                      fontStyle: FontStyle.normal,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              ToggleSwitch(
                customWidths: [screenWidth*0.216, screenWidth*0.12],
                cornerRadius: 20.0,
                activeBgColors: [[Colors.green], [Colors.redAccent]],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: ['DONE', 'X'],
                icons: [null, null],
                onToggle: (index) {
                  setState(() {
                    Switch3 = !Switch3;
                  });
                  saveToggleSwitchState3(Switch3);
                },
                initialLabelIndex: Switch3 ? 0 : 1,
                centerText: true,
              ),
            ],
          ),
        ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Work, Energy and Power",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch4 = !Switch4;
                      });
                      saveToggleSwitchState4(Switch4);
                    },
                    initialLabelIndex: Switch4 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Rotational Motion",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch5 = !Switch5;
                      });
                      saveToggleSwitchState5(Switch5);
                    },
                    initialLabelIndex: Switch5 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Gravitation",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch6 = !Switch6;
                      });
                      saveToggleSwitchState6(Switch6);
                    },
                    initialLabelIndex: Switch6 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Properties of Solids and Liquids",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch7 = !Switch7;
                      });
                      saveToggleSwitchState7(Switch7);
                    },
                    initialLabelIndex: Switch7 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Thermodynamics",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch8 = !Switch8;
                      });
                      saveToggleSwitchState8(Switch8);
                    },
                    initialLabelIndex: Switch8 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Kinetic Theory of Gases",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch9 = !Switch9;
                      });
                      saveToggleSwitchState9(Switch9);
                    },
                    initialLabelIndex: Switch9 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Oscillations and Waves",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch10 = !Switch10;
                      });
                      saveToggleSwitchState10(Switch10);
                    },
                    initialLabelIndex: Switch10 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Electrostatics",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch12 = !Switch12;
                      });
                      saveToggleSwitchState12(Switch12);
                    },
                    initialLabelIndex: Switch12 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Current Electricity",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch11 = !Switch11;
                      });
                      saveToggleSwitchState11(Switch11);
                    },
                    initialLabelIndex: Switch11 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Magnetic Effects of Current and Magnetism",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch13 = !Switch13;
                      });
                      saveToggleSwitchState13(Switch13);
                    },
                    initialLabelIndex: Switch13 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Electromagnetic Induction and Alternating Currents",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch14 = !Switch14;
                      });
                      saveToggleSwitchState14(Switch14);
                    },
                    initialLabelIndex: Switch14 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Electromagnetic Waves",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch15 = !Switch15;
                      });
                      saveToggleSwitchState15(Switch15);
                    },
                    initialLabelIndex: Switch15 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Optics",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch16 = !Switch16;
                      });
                      saveToggleSwitchState16(Switch16);
                    },
                    initialLabelIndex: Switch16 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Dual Nature of Matter and Radiation",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch17 = !Switch17;
                      });
                      saveToggleSwitchState17(Switch17);
                    },
                    initialLabelIndex: Switch17 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Atoms and Nuclei",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch18 = !Switch18;
                      });
                      saveToggleSwitchState18(Switch18);
                    },
                    initialLabelIndex: Switch18 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Electronic Devices",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch19 = !Switch19;
                      });
                      saveToggleSwitchState19(Switch19);
                    },
                    initialLabelIndex: Switch19 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*0.08,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.556,
                    child: Center(
                      child: Text(
                        "Communication Systems",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.032,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    customWidths: [screenWidth*0.216, screenWidth*0.12],
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['DONE', 'X'],
                    icons: [null, null],
                    onToggle: (index) {
                      setState(() {
                        Switch20 = !Switch20;
                        print("$t");
                      });
                      saveToggleSwitchState20(Switch20);
                    },
                    initialLabelIndex: Switch20 ? 0 : 1,
                    centerText: true,
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );

  }
}

