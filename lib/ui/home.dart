import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:studize/main.dart';
import 'package:studize/ui/chemistry.dart';
import 'package:studize/ui/maths.dart';
import 'package:studize/ui/physics.dart';
import 'package:studize/ui/biology.dart';
import 'package:studize/ui/Todo.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studize/ui/LoginPageReference/signin_screen.dart';

DateTime TodayDate= DateTime.now();


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences _prefs;
  late int hours = 0;
  late int StudyHours=0;
  late int StudyMinutes=0;
  ScrollController scrollController = ScrollController();
  int _selectedIndex = 0;
  int initialState=0;
  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      label: 'ToDo',
    ),
  ];
  final List<Widget> _screens = [
    HomeScreen(),
    HomeTodo(),
  // Replace this with the home screen widget if needed.

  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }
  @override
  void initState() {
    super.initState();
    _loadData();
    resetCounterAtMidnight();
  }

  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      StudyHours = _prefs.getInt('StudyHours') ?? 0;
      StudyMinutes = _prefs.getInt('StudyMinutes') ?? 0;
    });
  }

  Future<void> _saveDataSH(int value) async {
    setState(() {
      StudyHours = value;
    });
    await _prefs.setInt('StudyHours', value);
  }
  Future<void> _saveDataSM(int value) async {
    setState(() {
      StudyMinutes = value;
    });
    await _prefs.setInt('StudyMinutes', value);
  }

  // double percent =0;
  // static int TimeInMinute =2;
  // int TimeInSec=TimeInMinute*60;

  int second =59;
  int StudyTime=25;
  int PauseTime=5;
  int minute=24;
  int state=0;

  Timer? timer;
  void _StartTimer() {
    minute=StudyTime-1;
    print("StartTest");
    // TimeInMinute = 2;
    // int Time = TimeInMinute * 60;
    // double secPercent = (Time / 100);

  if(initialState==0){
    initialState=1;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        second--;
        if(minute!=0 && second==0 && state==0)
        {
          minute--;
          second=59;
          StudyMinutes++;
          _saveDataSH(StudyHours);
          _saveDataSM(StudyMinutes);
        }
        else if (minute==0 && second==0 && state==0)
        {
          second=59;
          state=1;
          minute=PauseTime-1;
          StudyMinutes++;
          _saveDataSH(StudyHours);
          _saveDataSM(StudyMinutes);
        }
        else if (minute!=0 && second==0 && state==1)
        {
          minute--;
          second=59;

        }
        else if (minute==0 && second==0 && state==1)
        {
          minute=StudyTime-1;
          second=59;
          state=0;

        }
        else if(StudyMinutes==60)
        {
          StudyHours++;
          StudyMinutes=0;
          _saveDataSH(StudyHours);
          _saveDataSM(StudyMinutes);
        }


      });

    });
  }


  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      minute=StudyTime-1;
      second=59;
      initialState=0;
      StudyHours=0;
      StudyMinutes=0;

    });
  }
  void resetCounterAtMidnight() {
    DateTime now = DateTime.now();
    DateTime midnight = DateTime(now.year, now.month, now.day + 1);
    Duration durationUntilMidnight = midnight.difference(now);

    Timer(durationUntilMidnight, () {
      setState(() {
        StudyHours = 0;
        StudyMinutes=0;
      });
      resetCounterAtMidnight();
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final difference = selectedDate.difference(TodayDate).inDays;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Studize",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: screenWidth*0.07,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (context){
            return [
              PopupMenuItem<int>(
                value: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text("Logout", style: TextStyle(
                      color: Colors.black
                  ),),
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text("Date of Exam:\n${selectedDate.day}:${selectedDate.month}:${selectedDate.year}", style: TextStyle(
                      color: Colors.black
                  ),),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text("Days Left\nin Exam:\n$difference", style: TextStyle(
                    color: Colors.black
                  ),),
                ),
              ),
              PopupMenuItem<int>(
                value: 0,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text("Reset App")
                ),


              ),

            ];
          },
            onSelected: (value) => handleMenuSelection(value),

          )
        ],

        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        padding: EdgeInsets.all(screenHeight*0.005),
        child: ListView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          children: <Widget>[   //start here
//pomdoro clock ------- VEDANT
            Container(
              margin: EdgeInsets.all(screenHeight*0.005),
              height: screenHeight*0.5,
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
                      padding: EdgeInsets.all(screenHeight*0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Pomodoro Clock",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth*0.05,
                                fontStyle: FontStyle.normal,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.05),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(30)),

                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: screenHeight*0.03,left: screenHeight*0.02,right: screenHeight*0.02),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(child: Row(
                                      children: <Widget>[
                                        Expanded(child: Column(
                                          children: <Widget>[
                                            Center(
                                              child: Text("Study Timer",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: screenWidth*0.05

                                              ),),
                                            ),
                                            SizedBox(height: screenHeight*0.003,),
                                            Center(
                                              child: TextField(
                                                keyboardType:
                                                TextInputType.numberWithOptions(decimal: false),
                                                style: TextStyle(color: Colors.black, fontSize: screenWidth*0.05),
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  hintText: "Default:25",
                                                  floatingLabelAlignment: FloatingLabelAlignment.center,
                                                  hintStyle: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w400,fontSize: screenHeight*0.015),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey.shade700),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey.shade700),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                onChanged: (String value) {
                                                  try {
                                                    StudyTime = int.parse(value);
                                                  } catch (exception) {
                                                    StudyTime = 25;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ))
                                      ],
                                    )),
                                    Expanded(child: Column(
                                      children: <Widget>[
                                        Center(
                                          child: Text("Pause Time",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: screenWidth*0.05

                                            ),),
                                        ),
                                        SizedBox(height: 3.0,),
                                        Center(
                                          child: TextField(
                                            keyboardType:
                                            TextInputType.numberWithOptions(decimal: false),
                                            style: TextStyle(color: Colors.black, fontSize: screenWidth*0.05),
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              hintText: "Default:5",
                                              floatingLabelAlignment: FloatingLabelAlignment.center,
                                              hintStyle: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w400,fontSize: screenHeight*0.015),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey.shade700),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey.shade700),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            onChanged: (String value) {
                                              try {
                                                PauseTime = int.parse(value);
                                              } catch (exception) {
                                                PauseTime = 25;
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ))

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: CircularPercentIndicator(
                            percent: (59-second)/59,
                            animation:  true,
                            animateFromLastPercent: true,
                            radius: 100.0,
                            lineWidth: 15.0,
                            progressColor: Colors.green,
                            center: Text(
                              "$minute:$second",
                              style: TextStyle(
                                color:  Colors.white,
                                fontSize: screenWidth*0.08
                              ),
                            ),

                          ),
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(bottom: screenHeight*0.01),
                        child:Column(
                          children: [
                            Container(
                              child: Text(
                                "Hours Studied Today",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth*0.05,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: screenHeight*0.01)),
                            Container(
                              child: Text(
                                "$StudyHours:$StudyMinutes",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth*0.05,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: screenHeight*0.01)),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed:
                                    _StartTimer,
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    // padding: EdgeInsets.symmetric(
                                    //   vertical: 10.0,
                                    //   horizontal: 50.0
                                    // )
                                  ),
                                  child: Container(
                                    width:screenWidth*0.192,
                                    height: screenHeight*0.055,
                                    margin: EdgeInsets.only(bottom: screenHeight*0.01),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        color:Colors.black
                                    ),
                                    child: Center(
                                      child: Text("Start Studying",
                                        textAlign:TextAlign.center,
                                        style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: screenWidth*0.032,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.green,
                                      ),),
                                    ),

                                  ),
                                ),
                                SizedBox(width: 3),
                                ElevatedButton(
                                  onPressed:
                                  stopTimer,
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    // padding: EdgeInsets.symmetric(
                                    //   vertical: 10.0,
                                    //   horizontal: 50.0
                                    // )
                                  ),
                                  child: Container(
                                    width:screenWidth*0.192,
                                    height: screenHeight*0.055,
                                    margin: EdgeInsets.only(bottom: screenHeight*0.01),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        color:Colors.black
                                    ),
                                    child: Center(
                                      child: Text("Reset",
                                        textAlign:TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth*0.032,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.green,
                                        ),),
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
            // TILL HERE

            Container(
              margin: EdgeInsets.all(screenHeight*0.005),
              height: screenHeight*0.250,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width:screenWidth*0.096,
                    height: screenHeight*0.040,
                    margin: EdgeInsets.all(screenHeight*0.002),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color:Colors.grey.shade900,
                    ),

                    child: Center(
                      child: Container(
                        height: screenHeight*0.040,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:Colors.green
                        ),

                        child: Center(
                          child: Text(
                            "Course List",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth*0.045,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),

                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>physics_syllabus()),
                      );
                      

                    },
                    child: Container(
                      width:screenWidth*0.096,
                      height: screenHeight*0.040,
                      margin: EdgeInsets.all(screenHeight*0.005),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color:Colors.black
                      ),
                      child: Center(
                        child: Text("Physics",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.045,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),),
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Chemistry_syllabus()),
                      );
                    },
                    child: Container(
                      width:screenWidth*0.096,
                      height: screenHeight*0.040,
                      margin: EdgeInsets.all(screenHeight*0.005),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color:Colors.black
                      ),
                      child: Center(
                        child: Text("Chemistry",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.045,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),),
                      ),

                    ),


                  ),
                  InkWell(

                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Maths_syllabus()),
                      );

                    },
                    child: Container(
                      width:screenWidth*0.096,
                      height: screenHeight*0.040,
                      margin: EdgeInsets.all(screenHeight*0.005),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color:Colors.black
                      ),
                      child: Center(
                        child: Text("Maths",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.045,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),),
                      ),

                    ),


                  ),
                  InkWell(

                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Biology_syllabus()),
                      );

                    },
                    child: Container(
                      width:screenWidth*0.096,
                      height: screenHeight*0.040,
                      margin: EdgeInsets.all(screenHeight*0.005),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color:Colors.black
                      ),
                      child: Center(
                        child: Text("Biology",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth*0.045,
                          fontStyle: FontStyle.normal,
                          color: Colors.green,
                        ),),
                      ),

                    ),


                  ),



                ],

              ),
            ),
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
                          Text(
                            "Days left In Exam",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth*0.045,
                              fontStyle: FontStyle.normal,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(screenHeight*0.010),
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 900,
                            interval: 50,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startValue: 0,
                                endValue: 20,
                                color: Colors.red.shade900,
                              ),
                              GaugeRange(
                                startValue: 20,
                                endValue: 40,
                                color: Colors.red.shade700,
                              ),
                              GaugeRange(
                                startValue: 40,
                                endValue: 60,
                                color: Colors.orange.shade600,
                              ),
                              GaugeRange(
                                startValue: 60,
                                endValue: 80,
                                color: Colors.green.shade200,
                              ),
                              GaugeRange(
                                startValue: 80,
                                endValue: 100,
                                color: Colors.green.shade400,
                              ),
                              GaugeRange(
                                startValue: 100,
                                endValue: 120,
                                color: Colors.green.shade600,
                              ),
                              GaugeRange(
                                startValue: 120,
                                endValue: 900,
                                color: Colors.green.shade900,
                              ),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: difference.toDouble(),
                                enableAnimation: true,
                                needleColor: Colors.lightGreen,
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                widget: Container(
                                  child: Text(
                                    '$difference days',
                                    style: TextStyle(
                                      fontSize: screenWidth*0.045,
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
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green.shade200,
        items: _bottomNavBarItems,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
      ),
    );
  }



  void handleMenuSelection(int value) {
    if (value == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StartingPage(initialOptions: 2,)),
      );
    }
    if(value==1){
      scrollController.animateTo(160,
          duration: Duration(seconds: 1), curve: Curves.easeIn);
    }
    if (value == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }

  }


}

