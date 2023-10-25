import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studize/firebase_options.dart';
import 'package:studize/screens/authorisation/sign_in.dart';
import 'package:studize/screens/main_container.dart';
import 'package:studize/styles.dart';

DateTime selectedDate = DateTime(2024, 04, 15);
DateTime todayDate = DateTime.now();
int date = todayDate.day;
int month = todayDate.month;
int year = todayDate.year;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int options = prefs.getInt('options') ?? 2;
  runApp(MyApp(options: options));
}

class MyApp extends StatelessWidget {
  final int options;

  const MyApp({Key? key, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget initialScreen;
    if (options == 0) {
      initialScreen = const MainContainer();
    } else if (options == 1) {
      initialScreen = const MainContainer();
    } else {
      // initialScreen = const SignInScreen();
      initialScreen=const MainContainer();
    }
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainAppTheme,
      home: initialScreen,
    );
  }
}

class StartingPage extends StatefulWidget {
  final int initialOptions;

  const StartingPage({Key? key, this.initialOptions = 2}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  late SharedPreferences _prefs;
  final String _prefsKey = 'options';
  int options = 2;
  int difference = 0;

  @override
  void initState() {
    super.initState();
    _loadOptions();
  }

  void _loadOptions() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      options = _prefs.getInt(_prefsKey) ?? 2;
      // int year = _prefs.getInt('selectedYear') ?? DateTime.now().year;
      // int month = _prefs.getInt('selectedMonth') ?? DateTime.now().month;
      // int day = _prefs.getInt('selectedDay') ?? DateTime.now().day;
      // selectedDate = DateTime(year, month, day);

      if (options != 2) {
        _updateOptions(2);
      }
    });
  }

  void _updateOptions(int value) {
    setState(() {
      options = value;
      _prefs.setInt(_prefsKey, value);
    });
  }

  // void _updateOptionsDate(DateTime value) {
  //   setState(() {
  //     selectedDate = value;
  //     _prefs.setInt('selectedYear', selectedDate.year);
  //     _prefs.setInt('selectedMonth', selectedDate.month);
  //     _prefs.setInt('selectedDay', selectedDate.day);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Studize",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.07,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        padding: EdgeInsets.all(screenWidth * 0.0125),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.04,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "Select Exam Type",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.045,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _updateOptions(0),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          options == 0 ? Colors.green : Colors.grey,
                        ),
                      ),
                      child: Text(
                        'JEE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.0296,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateOptions(1),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          options == 1 ? Colors.green : Colors.grey,
                        ),
                      ),
                      child: Text(
                        'NEET',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.0296,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(screenWidth * 0.044)),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: proceedState,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white60,
                ),
              ),
              child: Container(
                width: screenWidth * 0.50,
                height: screenHeight * 0.050,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    "Click Here To Proceed",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.035,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> proceedState() async {
    if (options == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainContainer()),
      );
    } else if (options == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainContainer()),
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Request'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Please select any one exam type.'),
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
        },
      );
    }
  }
}
