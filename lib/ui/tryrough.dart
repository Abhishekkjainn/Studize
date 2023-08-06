import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:studize/main.dart';
import 'package:studize/ui/chemistry.dart';
import 'package:studize/ui/biology.dart';
import 'package:studize/ui/physics.dart';
import 'package:studize/ui/Todo.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:shared_preferences/shared_preferences.dart';

DateTime TodayDate= DateTime.now();


class HomeScreenb extends StatefulWidget {
  const HomeScreenb({Key? key}) : super(key: key);

  @override
  State<HomeScreenb> createState() => _HomeScreenbState();
}

class _HomeScreenbState extends State<HomeScreenb> {
  late SharedPreferences _prefs;
  late int hours = 0;
  ScrollController scrollController = ScrollController();
  int _selectedIndex = 0;

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
    HomeScreenb(),
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
  }

  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      hours = _prefs.getInt('hours') ?? 0;
    });
  }

  Future<void> _saveData(int value) async {
    setState(() {
      hours = value;
    });
    await _prefs.setInt('hours', value);
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final difference = selectedDate.difference(TodayDate).inDays;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Studize",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (context){
            return [
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
                    child: Text("Reset App")),


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
        padding: EdgeInsets.all(5.0),
        child: ListView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              height: 250,
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
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Hours studied Today",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              fontStyle: FontStyle.normal,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: TextField(
                              keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                              style: TextStyle(color: Colors.white, fontSize: 15),
                              decoration: InputDecoration(
                                hintText: "Hours",
                                hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),
                                prefixIcon:
                                Icon(Icons.access_alarm, color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (String value) {
                                try {
                                  hours = int.parse(value);
                                  _saveData(hours);
                                } catch (exception) {
                                  hours = 0;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 24,
                            interval: 3,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startValue: 0,
                                endValue: 3,
                                color: Colors.red.shade900,
                              ),
                              GaugeRange(
                                startValue: 3,
                                endValue: 6,
                                color: Colors.red.shade700,
                              ),
                              GaugeRange(
                                startValue: 6,
                                endValue: 9,
                                color: Colors.red.shade500,
                              ),
                              GaugeRange(
                                startValue: 9,
                                endValue: 12,
                                color: Colors.orange.shade600,
                              ),
                              GaugeRange(
                                startValue: 12,
                                endValue: 15,
                                color: Colors.green.shade200,
                              ),
                              GaugeRange(
                                startValue: 15,
                                endValue: 18,
                                color: Colors.green.shade400,
                              ),
                              GaugeRange(
                                startValue: 18,
                                endValue: 21,
                                color: Colors.green.shade600,
                              ),
                              GaugeRange(
                                startValue: 21,
                                endValue: 24,
                                color: Colors.green.shade900,
                              ),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: hours.toDouble(),
                                enableAnimation: true,
                                needleColor: Colors.lightGreen,
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                widget: Container(
                                  child: Text(
                                    '$hours Hrs',
                                    style: TextStyle(
                                      fontSize: 25,
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
            Container(
              margin: EdgeInsets.all(5.0),
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width:40.0,
                    height: 40.0,
                    margin: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color:Colors.grey.shade900,
                    ),

                    child: Center(
                      child: Container(
                        height: 40,
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
                              fontSize: 30,
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
                      width:40.0,
                      height: 40.0,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color:Colors.black
                      ),
                      child: Center(
                        child: Text("Physics",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
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
                      width:40.0,
                      height: 40.0,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color:Colors.black
                      ),
                      child: Center(
                        child: Text("Chemistry",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
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
                      width:40.0,
                      height: 40.0,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color:Colors.black
                      ),
                      child: Center(
                        child: Text("Biology",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
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

              margin: EdgeInsets.all(5.0),
              height: 250,
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
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Days left In Exam",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
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
                      padding: EdgeInsets.all(10.0),
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
                                      fontSize: 25,
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
            )



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
  }
}
