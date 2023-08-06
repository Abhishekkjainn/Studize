import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:studize/ui/home.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


const Color tdRed = Color(0xFFDA4040);
const Color tdBlue = Color(0xFF5F52EE);

const Color tdBlack = Color(0xFF3A3A3A);
const Color tdGrey = Color(0xFF717171);

const Color tdBGColor = Color(0xFFEEEFF5);



class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  int todoHours;


  ToDo({
    required this.id,
    required this.todoText,
    required this.todoHours,
    this.isDone = false,
  });
  static List<ToDo> todoList() {
    return [
    ];
  }



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone,
      'todoHours':todoHours
    };
  }

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'],
      todoText: map['todoText'],
      isDone: map['isDone'],
      todoHours: map['todoHours'],
    );
  }
}

class HomeTodo extends StatefulWidget {
  HomeTodo({Key? key}) : super(key: key);

  @override
  State<HomeTodo> createState() => _HomeState();
}

class _HomeState extends State<HomeTodo> {
  int expectedHours=0;
  late SharedPreferences _prefs;
  final List<ToDo> todosList = [];
  List<ToDo> _foundToDo = [];
  int _selectedIndex = 0;
  final _todoController = TextEditingController();
  late int hourSum=0;
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
    initSharedPreferences();
    _loadData();
  }

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    loadTodos();
  }

  void loadTodos() {
    final List<String>? todosStringList = _prefs.getStringList('todos');
    if (todosStringList != null) {
      setState(() {
        todosList.clear();
        for (final todoString in todosStringList) {
          final Map<String, dynamic> todoMap = Map<String, dynamic>.from(
            Map<String, dynamic>.from(jsonDecode(todoString)),
          );
          final todo = ToDo.fromMap(todoMap);
          todosList.add(todo);
        }
        _foundToDo = todosList;
      });
    }
  }

  Future<void> saveTodos() async {
    final List<String> todosStringList = todosList.map((todo) {
      return jsonEncode(todo.toMap());
    }).toList();
    await _prefs.setStringList('todos', todosStringList);
  }

  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      hourSum = _prefs.getInt('hourSum') ?? 0;
    });
  }

  Future<void> _saveData(int value) async {
    setState(() {
      hourSum = value;
    });
    await _prefs.setInt('hourSum', value);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tdBGColor,
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
        automaticallyImplyLeading: false,
        // leading: BackButton(
        //   onPressed: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => HomeScreen()),
        //   ),
        // ),
      ),
      body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth*0.048,
              vertical: screenHeight*.015,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(screenHeight*0.005),
                  height: screenWidth*0.400,
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
                                "Expected Hours You need to study today",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth*0.05,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(height: screenHeight*0.010),
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
                                    value: hourSum.toDouble(),
                                    enableAnimation: true,
                                    needleColor: Colors.lightGreen,
                                  ),
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Container(
                                      child: Text(
                                        '$hourSum Hrs',
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.all(screenHeight*0.005),
                        child: Center(
                          child: Text(
                            'All ToDos',
                            style: TextStyle(
                              fontSize: screenWidth*0.07,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(

                      children: [

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: screenHeight*0.020,
                              right: screenHeight*0.020,
                              left: screenHeight*0.020,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: screenHeight*0.020,
                              vertical: screenHeight*0.005,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _todoController,
                              decoration: InputDecoration(
                                  hintText: 'Add a new todo item',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: screenHeight*0.020,
                            right: screenHeight*0.020,
                          ),
                          child: ElevatedButton(
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: screenHeight*0.040,
                              ),
                            ),
                            onPressed: () {
                              _addToDoItem(_todoController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tdBlue,
                              minimumSize: Size(screenHeight*0.060, screenHeight*0.060),
                              elevation: 10,
                            ),
                          ),
                        ),
                      ]),
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


  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    saveTodos();
    _saveData(hourSum);

  }

  void _deleteToDoItem(String id) {
    final deletedTodo = todosList.firstWhere((item) => item.id == id);
    setState(() {
      todosList.removeWhere((item) => item.id == id);
      hourSum -= deletedTodo.todoHours; // Subtract the deleted task's hours from hourSum
    });
    saveTodos();
    _saveData(hourSum);
  }



  //
  // void _handleToDoChange(ToDo todo) {
  //   setState(() {
  //     todo.isDone = !todo.isDone;
  //   });
  //   saveTodos();
  // }
  //
  // void _deleteToDoItem(String id) {
  //   setState(() {
  //     todosList.removeWhere((item) => item.id == id);
  //   });
  //   saveTodos();
  // }

  void _addToDoItem(String toDo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if(hourSum<=24){
          return
          AlertDialog(
            title: Text('Expected Hours to finish this task'),
            content: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                expectedHours = int.tryParse(value) ?? 0;
                // hourSum+=expectedHours;
              },
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    hourSum+=expectedHours;
                    todosList.add(ToDo(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        todoText: toDo,
                        todoHours: expectedHours

                    ));
                    saveTodos(); // Save the updated list of todos
                    loadTodos();
                    _saveData(hourSum);
                  });
                  _todoController.clear();
                  print("$hourSum");
                  Navigator.pop(context);


                },
              ),
            ],
          );
        }
        else{

                return AlertDialog(
                  title: const Text('Invalid Request'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('You cannot add task taking more than 24 hours to cover'),
                        Text('Would you like to continue?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Continue'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );

        }

      },
    );
  }



}

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(String) onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id!);
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: HomeTodo(),
    );
  }
}
