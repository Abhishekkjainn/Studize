import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:studize/screens/authorisation/phone_authentication/numeric_pad.dart';
import 'package:studize/screens/authorisation/phone_authentication/done.dart';
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:studize/firebase_options.dart';
import 'package:studize/constants/colors.dart';
import 'package:studize/main.dart';
import 'package:studize/screens/authorisation/phone_authentication/NumericPad.dart';
>>>>>>> dev-rakshit

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
<<<<<<< HEAD
  final TextEditingController _codecontroller = TextEditingController();
=======


  final TextEditingController _codecontroller = new TextEditingController();
>>>>>>> dev-rakshit
  String phoneNumber = "", data = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smscode = "";

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsFlutterBinding.ensureInitialized();
  //   // Firebase.initializeApp(
  //   // options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase
  // }

  _signInWithMobileNumber() async {
    // // The following variables were declared but never used.
    // // Commented out to remove warnings.
    // UserCredential credential;
    // User user;
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+91${data.trim()}',
          verificationCompleted: (PhoneAuthCredential authCredential) async {
            await _auth.signInWithCredential(authCredential).then((value) {
<<<<<<< HEAD
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Done()));
=======
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const StartingPage()));
>>>>>>> dev-rakshit
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
<<<<<<< HEAD
                      title: const Text("Enter OTP"),
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
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: smscode);
                              auth
                                  .signInWithCredential(credential)
                                  .then((result) {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Done()));
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: const Text("Done"))
                      ],
                    ));
=======
                  title: const Text("Enter OTP"),
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
                                      builder: (context) => const StartingPage()));
                            }
                          }).catchError((e) {
                            print(e);
                          });
                        },
                        child: const Text("Done"))
                  ],
                ));
>>>>>>> dev-rakshit
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = verificationId;
          },
          timeout: const Duration(seconds: 45));
<<<<<<< HEAD
    } catch (e) {
      print('Failed to login with mobile number');
    }
=======
    } catch (e) {}
>>>>>>> dev-rakshit
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Continue with phone",
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 130,
                    child: Image.asset('assets/icon/phoneAuth.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 64),
                    child: Text(
                      "You'll receive a 6 digit code to verify next.",
                    ),
<<<<<<< HEAD
                  ),
                ],
=======
                    const Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 64),
                      child: Text(
                        "You'll receive a 6 digit code to verify next.",
                      ),
                    ),
                  ],
                ),
>>>>>>> dev-rakshit
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Enter your phone",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            phoneNumber,
                            style: const TextStyle(
<<<<<<< HEAD
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
=======
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
>>>>>>> dev-rakshit
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
<<<<<<< HEAD
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(25)),
=======
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(25)
                          ),
>>>>>>> dev-rakshit
                          child: const Center(
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
