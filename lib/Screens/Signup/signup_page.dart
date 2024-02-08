// import 'package:educational_app/Screens/Login/LoginScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final databaseReference = FirebaseFirestore.instance;
//   final usernamecontroller = TextEditingController();
//   final emailcontroller = TextEditingController();
//   final passwordcontroller = TextEditingController();

//   Future signup(BuildContext context) async {
//     try {
//       var user;
//       var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: emailcontroller.text, password: passwordcontroller.text);
//       user = result.user;
//       // await user.sendEmailVerification();
//       await databaseReference.collection("User").doc(user.uid).set({
//         'email': emailcontroller.text,
//         'password': passwordcontroller.text,
//         'username': usernamecontroller.text,
//         'photourl': null,
//       });
//       setState(() {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("Now Enter your Email and Password and Login:)"),
//         ));
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const LoginScreen()));
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   bool visible = false;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//           body: Builder(
//         builder: (context) => SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
//                 width: double.infinity,
//                 height: size.height * 0.4,
//                 child: SvgPicture.asset("assets/images/signup.svg"),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: size.height * 0.05,
//                 margin: const EdgeInsets.only(top: 10),
//                 child: const Text(
//                   "SignUp",
//                   style: TextStyle(
//                     color: Color(0xFF62B9BF),
//                     fontSize: 27,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(
//                     left: 30, right: 30, top: 20, bottom: 10),
//                 padding: const EdgeInsets.only(left: 20),
//                 decoration: const BoxDecoration(
//                     color: Color(0xFFDBF3FA),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     )),
//                 child: TextField(
//                   onChanged: null,
//                   decoration: const InputDecoration(
//                     icon: Icon(
//                       Icons.person,
//                       color: Color(0xFF62B9BF),
//                     ),
//                     hintText: "Username",
//                     border: InputBorder.none,
//                   ),
//                   controller: usernamecontroller,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(
//                     left: 30, right: 30, top: 10, bottom: 10),
//                 padding: const EdgeInsets.only(left: 20),
//                 decoration: const BoxDecoration(
//                     color: Color(0xFFDBF3FA),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     )),
//                 child: TextField(
//                   onChanged: null,
//                   decoration: const InputDecoration(
//                     icon: Icon(
//                       Icons.mail,
//                       color: Color(0xFF62B9BF),
//                     ),
//                     hintText: "Your Email",
//                     border: InputBorder.none,
//                   ),
//                   controller: emailcontroller,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(
//                     left: 30, right: 30, top: 10, bottom: 10),
//                 padding: const EdgeInsets.only(left: 20),
//                 decoration: const BoxDecoration(
//                     color: Color(0xFFDBF3FA),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     )),
//                 child: TextField(
//                   onChanged: null,
//                   obscureText: visible == false ? true : false,
//                   decoration: InputDecoration(
//                     icon: const Icon(
//                       Icons.lock,
//                       color: Color(0xFF62B9BF),
//                     ),
//                     hintText: "Password",
//                     border: InputBorder.none,
//                     suffixIcon: _visible(),
//                   ),
//                   controller: passwordcontroller,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 10, bottom: 10),
//                 width: size.width * 0.85,
//                 decoration: const BoxDecoration(
//                     color: Color(0xFF62B9BF),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     )),
//                 child: TextButton(
//                   onPressed: () async {
//                     signup(context);
//                   },
//                   child: const Text(
//                     "SIGNUP",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text(
//                     "Already have an Account ? ",
//                     style: TextStyle(color: Color(0xFF62B9BF)),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LoginScreen()));
//                     },
//                     child: const Text(
//                       "Log In",
//                       style: TextStyle(
//                         color: Color(0xFF62B9BF),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }

//   _visible() {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           visible = !visible;
//         });
//       },
//       child: visible == true
//           ? const Icon(
//               Icons.visibility_off,
//               color: Color(0xFF62B9BF),
//             )
//           : const Icon(
//               Icons.visibility,
//               color: Color(0xFF62B9BF),
//             ),
//     );
//   }
// }

import 'package:educational_app/Screens/Login/LoginScreen.dart';
import 'package:educational_app/components/Configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final databaseReference = FirebaseFirestore.instance;
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool visible = false;
  bool isLoading = false;

  @override
  void dispose() {
    usernamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> signup(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });

      var user;
      // await user.sendEmailVerification();
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      user = result.user;

      await databaseReference.collection("User").doc(user.uid).set({
        'email': emailcontroller.text,
        'password': passwordcontroller.text,
        'username': usernamecontroller.text,
        'photourl': null,
      });

      await _navigateToLoginScreen(context);
    } catch (e) {
      print(e);
      String errorMessage = 'An error occurred';
      if (e is FirebaseAuthException) {
        errorMessage = e.message!;
      }
      // ignore: use_build_context_synchronously
      _showErrorSnackBar(context, errorMessage);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _navigateToLoginScreen(BuildContext context) async {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Now Enter your Email and Password and Login:)"),
        backgroundColor: primaryGreen,
      ));
    });

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
      backgroundColor: primaryGreen,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
                  width: double.infinity,
                  height: size.height * 0.4,
                  child: SvgPicture.asset("assets/images/signup.svg"),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height * 0.05,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "SignUp",
                    style: TextStyle(
                      color: Color(0xFF62B9BF),
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 10),
                  padding: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                      color: Color(0xFFDBF3FA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextField(
                    onChanged: null,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xFF62B9BF),
                      ),
                      hintText: "Username",
                      border: InputBorder.none,
                    ),
                    controller: usernamecontroller,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  padding: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                      color: Color(0xFFDBF3FA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextField(
                    onChanged: null,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        color: Color(0xFF62B9BF),
                      ),
                      hintText: "Your Email",
                      border: InputBorder.none,
                    ),
                    controller: emailcontroller,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  padding: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                      color: Color(0xFFDBF3FA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextField(
                    onChanged: null,
                    obscureText: visible == false ? true : false,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.lock,
                        color: Color(0xFF62B9BF),
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon: _visible(),
                    ),
                    controller: passwordcontroller,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: size.width * 0.85,
                  decoration: const BoxDecoration(
                      color: Color(0xFF62B9BF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextButton(
                    onPressed: () async {
                      await signup(context);
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "SIGNUP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Have an Account ? ",
                      style: TextStyle(color: Color(0xFF62B9BF)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFF62B9BF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                // ... rest of the code remains unchanged
              ],
            ),
          ),
        ),
      ),
    );
  }

  _visible() {
    return GestureDetector(
      onTap: () {
        setState(() {
          visible = !visible;
        });
      },
      child: visible == true
          ? const Icon(
              Icons.visibility_off,
              color: Color(0xFF62B9BF),
            )
          : const Icon(
              Icons.visibility,
              color: Color(0xFF62B9BF),
            ),
    );
  }
}
