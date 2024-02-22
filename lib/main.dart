import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studize/constants/splashController.dart';
import 'package:studize/firebase_options.dart';
import 'package:studize/screens/authorisation/sign_in.dart';
import 'package:studize/screens/main_container.dart';
import 'package:studize/services/syllabus/syllabus_service.dart';
import 'package:studize/services/tasks/tasks_init_functions.dart';
import 'package:studize/styles.dart';
import 'package:studize/constants/globals.dart';
import 'package:lottie/lottie.dart';
import 'onBoardingScreens/onB1.dart';

DateTime selectedDate = DateTime(2024, 04, 15);
DateTime todayDate = DateTime.now();
int date = todayDate.day;
int month = todayDate.month;
int year = todayDate.year;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSujbects(targetCourse: 'JEE');
  await Firebase.initializeApp();
  SyllabusService.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int options = prefs.getInt('options') ?? 2;
  await GetStorage.init();

  // userUID = FirebaseAuth.instance.currentUser?.uid;
  runApp(MyApp(options: options));
}

class MyApp extends StatefulWidget {
  final int options;
  SplashController splash = Get.put(SplashController());
  MyApp({Key? key, required this.options}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SplashController splash = Get.put(SplashController());
  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    // splash.SetSplash(null);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget initialScreen;
    if (widget.options == 0) {
      initialScreen = const MainContainer();
    } else if (widget.options == 1) {
      initialScreen = const MainContainer();
    } else {
      if (isUser == true) {
        initialScreen = isLogin ? const MainContainer() : const SignInScreen();
      } else {
        initialScreen = isLogin ? const StartingPage() : const SignInScreen();
      }

      // initialScreen = const MainContainer();
    }
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            // TODO: show loading screen.
            return const Placeholder();
          case ConnectionState.done:
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: mainAppTheme,
              darkTheme: mainAppThemeDark,
              themeMode: ThemeMode.system,
              home: SplashScreen(),
            );
          case ConnectionState.none:
          default:
            // TODO: show an error screen.
            return const Placeholder();
        }
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
    navigateToMain();
  }

  void navigateToMain() async {
    await Future.delayed(Duration(milliseconds: 5000));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return OnBoarding1();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 1, 20, 36),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/studizelogo.json',
                width: 100, height: 100, repeat: false),
            SizedBox(
              width: 20,
            ),
            AnimatedBuilder(
                animation: _slideAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_slideAnimation.value, 0),
                    child: child,
                  );
                },
                child: AnimatedBuilder(
                  animation: _opacityAnimation,
                  builder: (context, child) {
                    return Text(
                      'Studize',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 222, 240, 255)
                              .withOpacity(_opacityAnimation.value),
                          fontSize: 26 * (_opacityAnimation.value),
                          fontWeight: FontWeight.w600),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController instituteController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController boardController = TextEditingController();
  String selectedYear = '2023'; // Default selected year
  String selectedEducationBoard = 'CBSE';
  String selectedCoachingInstitute = 'NONE'; // Default selected education board

  @override
  void initState() {
    super.initState();
    _loadOptions();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      age = prefs.getInt('age') ?? 0;
      instituteName = prefs.getString('institute') ?? '';
      yearOfAppearing = prefs.getInt('year') ?? 0;
      educationBoard = prefs.getString('board') ?? '';
    });
  }

  Future<void> saveUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setInt('age', age);
    await prefs.setString('institute', instituteName);
    await prefs.setInt('year', yearOfAppearing);
    await prefs.setString('board', educationBoard);
  }

  Future addUserDetails(
      String name,
      int age,
      String gender,
      String coaching_institue,
      String year_of_appearing,
      String education_board) async {
    await FirebaseFirestore.instance.collection("users").doc(userUID).set({
      'name': name,
      'age': age,
      'gender': gender,
      'coaching_institute': coaching_institue,
      'year_of_appearing': year_of_appearing,
      'education_board': education_board
    });
  }

  void _loadOptions() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      options = _prefs.getInt(_prefsKey) ?? 2;
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

  void _handleGenderChange(String? value) {
    setState(() {
      selectedGender = value;
    });
  }

  void _handleYearChange(String? newValue) {
    setState(() {
      selectedYear =
          newValue ?? '2023'; // Provide a default value if newValue is null
    });
  }

  void _handleEducationBoardChange(String? newValue) {
    setState(() {
      selectedEducationBoard =
          newValue ?? 'CBSE'; // Provide a default value if newValue is null
    });
  }

  void _handleCoachingInstituteChange(String? newValue) {
    setState(() {
      selectedCoachingInstitute =
          newValue ?? 'NONE'; // Provide a default value if newValue is null
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info Storage'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    age = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Gender:'),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: _handleGenderChange,
                  ),
                  const Text('Male'),
                  const SizedBox(width: 16),
                  Radio<String>(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: _handleGenderChange,
                  ),
                  const Text('Female'),
                  const SizedBox(width: 16),
                  Radio<String>(
                    value: 'Other',
                    groupValue: selectedGender,
                    onChanged: _handleGenderChange,
                  ),
                  const Text('Other'),
                ],
              ),
              DropdownButtonFormField<String>(
                value: selectedCoachingInstitute,
                onChanged: _handleCoachingInstituteChange,
                items: [
                  'FIITJEE',
                  'Resonance',
                  'Allen Career Institute',
                  'Bansal Classes',
                  'Aakash Institute',
                  'Narayana Institute',
                  'Vibrant Academy',
                  'Super 30',
                  'PACE IIT & Medical',
                  'Brilliant Tutorials',
                  'Vidyalankar Classes',
                  'IITians Pace',
                  'Sri Chaitanya Educational Institutions',
                  'Akashdeep Classes',
                  'Career Point',
                  'Rao IIT Academy',
                  'Nucleus Education',
                  'Narayana IIT Academy',
                  'Motion IIT-JEE',
                  'Prerna Classes',
                  'Others',
                  'NONE'
                ].map((coachingInstitute) {
                  return DropdownMenuItem<String>(
                    value: coachingInstitute,
                    child: Text(
                      coachingInstitute,
                      style: const TextStyle(fontSize: 13),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                    labelText: 'Coaching Institute',
                    labelStyle: TextStyle(fontSize: 22)),
              ),
              DropdownButtonFormField<String>(
                value: selectedYear,
                onChanged: _handleYearChange,
                items: ['2023', '2024', '2025', '2026', '2027'].map((year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(
                      year,
                      style: const TextStyle(fontSize: 13),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                    labelText: 'Year of Appearing',
                    labelStyle: TextStyle(fontSize: 22)),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String?>(
                value: selectedEducationBoard,
                onChanged: _handleEducationBoardChange,
                items: [
                  'CBSE',
                  'ICSE',
                  'MSBSHSE',
                  'UPMSP',
                  'WBCHSE',
                  'TNBSE',
                  'KSEEB',
                  'BIEAP',
                  'TSBIE',
                  'NIOS',
                  'CISCE',
                  'KVS',
                  'NVS',
                  'State Open School Boards',
                  'International Boards',
                  'Others',
                ].map((board) {
                  return DropdownMenuItem<String?>(
                    value: board,
                    child: Text(
                      board,
                      style: const TextStyle(fontSize: 13),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Education Board',
                  labelStyle: TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isUser = true;
                  });
                  if (name != '' && age != 0 && selectedGender != '') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainContainer()));
                    saveUserInfo();

                    addUserDetails(
                        name,
                        age,
                        selectedGender.toString(),
                        selectedCoachingInstitute,
                        selectedYear,
                        selectedEducationBoard);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User information saved.'),
                      ),
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
                                Text('Please fill all the details'),
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
                  username = extractFirstName(name);
                },
                child: const Text('Save'),
              ),
              //TO ACCESS THE USER INFO

              // const SizedBox(height: 16),
              // const Text('User Information:'),
              // Text('Name: $name'),
              // Text('Age: $age'),
              // Text('Coaching Institute: $instituteName'),
              // Text('Year of Appearing: $yearOfAppearing'),
              // Text('Education Board: $educationBoard'),

              //TO ACCESS THE USER INFO
            ],
          ),
        ),
      ),
    );
  }

  Future<void> proceedState() async {
    if (name == "") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainContainer()),
      );
    } else if (options == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainContainer()),
      );
    } else {}
  }
}

String extractFirstName(String fullName) {
  List<String> nameParts = fullName.split(' ');
  if (nameParts.isNotEmpty) {
    return nameParts[0];
  }
  return 'Username';
}
