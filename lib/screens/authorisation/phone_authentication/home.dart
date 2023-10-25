import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studize/firebase_options.dart';
import 'package:studize/constants/colors.dart';
import 'package:studize/screens/authorisation/phone_authentication/NumericPad.dart';
import 'package:studize/screens/authorisation/phone_authentication/done.dart';



class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();


}

class _HomeState extends State<Home> {


  TextEditingController _codecontroller = new TextEditingController();
  String phoneNumber = "", data = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smscode = "";

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase

  }

  _signInWithMobileNumber() async {
    UserCredential _credential;
    User user;
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+91' + data.trim(),
          verificationCompleted: (PhoneAuthCredential authCredential) async {
            await _auth.signInWithCredential(authCredential).then((value) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Done()));
            });
          },
          verificationFailed: ((error) {
            print(error);
          }),
          codeSent: (String verificationId, [int? forceResendingToken]) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: Text("Enter OTP"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _codecontroller,
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          smscode = _codecontroller.text;
                          PhoneAuthCredential _credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId,
                              smsCode: smscode);
                          auth
                              .signInWithCredential(_credential)
                              .then((result) {
                            if (result != null) {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Done()));
                            }
                          }).catchError((e) {
                            print(e);
                          });
                        },
                        child: Text("Done"))
                  ],
                ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = verificationId;
          },
          timeout: Duration(seconds: 45));
    } catch (e) {}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Continue with phone",
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 130,
                      child: Image.asset('assets/icon/phoneAuth.png'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 64),
                      child: Text(
                        "You'll receive a 6 digit code to verify next.",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Enter your phone",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            phoneNumber,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          data = phoneNumber;
                          phoneNumber = "";

                          setState(() {});

                          _signInWithMobileNumber();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(
                            child: Text(
                              "Continue",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NumericPad(
              onNumberSelected: (value) {
                setState(() {
                  if (value != -1) {
                    phoneNumber = phoneNumber + value.toString();
                  } else {
                    phoneNumber =
                        phoneNumber.substring(0, phoneNumber.length - 1);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}