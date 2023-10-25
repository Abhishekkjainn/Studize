import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studize/firebase_options.dart';
import 'package:studize/screens/authorisation/sign_in.dart';
import 'package:studize/screens/main_container.dart';
import 'package:studize/styles.dart';
import 'package:studize/constants/globals.dart';

DateTime selectedDate = DateTime(2024, 04, 15);
DateTime todayDate = DateTime.now();
int date = todayDate.day;
int month = todayDate.month;
int year = todayDate.year;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase
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
      initialScreen = const MainContainer();
    }
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainAppTheme,
      darkTheme: mainAppThemeDark,
      themeMode: ThemeMode.system,
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                  if (name != '' && age != 0 && selectedGender != '') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainContainer()));
                    await saveUserInfo();
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
