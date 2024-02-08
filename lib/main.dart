import 'package:educational_app/Screens/Chatgpt/conversation_provider.dart';
import 'package:educational_app/Screens/HomePage/home_page.dart';
import 'package:educational_app/Screens/Welcome/splash_screen.dart';
import 'package:educational_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  bool login = prefs.containsKey('userId') ? true : false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ConversationProvider(),
      child: MyApp(
        login: login,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.login});
  final bool login;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: unrelated_type_equality_checks
      home: widget.login ? const HomePage() : const SplashScreen(),
      // home: SignUpScreen(),
    );
  }
}
