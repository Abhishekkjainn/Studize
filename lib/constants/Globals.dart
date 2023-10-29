import 'package:firebase_auth/firebase_auth.dart';




String name = '';
String username = '';
int age = 0;
String? selectedGender='';
String instituteName = '';
int yearOfAppearing = 0;
String educationBoard = '';
String? userUID;



var auth = FirebaseAuth.instance;


var isLogin = false;
var isUser = false;