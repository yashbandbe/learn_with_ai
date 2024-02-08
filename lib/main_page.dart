import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_app/Screens/Chatgpt/chat_page.dart';
import 'package:educational_app/Screens/Quiz_Page/home_quiz.dart';
import 'package:educational_app/Screens/Translate_Screen.dart/translate.dart';
import 'package:educational_app/components/Configuration.dart';
import 'package:educational_app/youtube_player/youtube_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: const Color(0xFFB7E9F7),
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    isDrawerOpen
                        ? IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                          )
                        : IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              setState(() {
                                xOffset = 230;
                                yOffset = 150;
                                scaleFactor = 0.6;
                                isDrawerOpen = true;
                              });
                            }),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          'Learn With AI',
                          style: TextStyle(
                            color: primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatPage(),
                            ));
                      },
                      icon: Image.asset(
                        "resources/avatars/ChatGPT_logo.png",
                        width: 35,
                        height: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Translate(),
                            ));
                      },
                      icon: Icon(
                        Icons.g_translate,
                        size: 30,
                        color: primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
              _container(0.0, 30.0, 10.0, const Color(0xFF62B9BF), "Courses",
                  "assets/images/logo.jpeg"),

              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              //   margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(20)
              //   ),
              //   child: Row(
              //     children: [
              //       Icon(Icons.search),
              //       SizedBox(width: 50,),
              //       Text('Search your favourite Course'),
              //
              //     ],
              //   ),
              // ),

              const SizedBox(
                height: 21,
              ),

              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuizHome(),
                                ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  categories[index]["iconPath"],
                                  height: 40,
                                  width: 40,
                                  color: primaryGreen,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  categories[index]['name'],
                                  style: TextStyle(color: primaryGreen),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Youtube_Player(
                                videoID: const [
                                  'kQUG_S3dGF8',
                                  'BaO1E21SpkI',
                                  'xzZLdYd78_8',
                                  '_WoCV4c6XOE',
                                  'aT61nwd5U-s',
                                  'Hwr4gEHepOo',
                                ],
                              )));
                },
                child: Container(
                  height: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[300],
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: shadowList,
                                  image: const DecorationImage(
                                      image: AssetImage('assets/images/1.jpeg'),
                                      fit: BoxFit.cover)),
                              margin: const EdgeInsets.only(top: 50),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(top: 60, bottom: 20),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Center(
                            child: Text(
                          "1st Standard:Start Learning Now",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        )),
                      ))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Youtube_Player(
                                videoID: const [
                                  'kQUG_S3dGF8',
                                  'BaO1E21SpkI',
                                  'xzZLdYd78_8',
                                  '_WoCV4c6XOE',
                                  'aT61nwd5U-s',
                                  'Hwr4gEHepOo',
                                ],
                              )));
                },
                child: Container(
                  height: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: shadowList,
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/2.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: const EdgeInsets.only(top: 50),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(top: 60, bottom: 20),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Center(
                            child: Text(
                          "2nd Standard:Start Learning Now!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        )),
                      ))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Youtube_Player(
                                videoID: const [
                                  'kQUG_S3dGF8',
                                  'BaO1E21SpkI',
                                  'xzZLdYd78_8',
                                  '_WoCV4c6XOE',
                                  'aT61nwd5U-s',
                                  'Hwr4gEHepOo',
                                ],
                              )));
                },
                child: Container(
                  height: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: shadowList,
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/3.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: const EdgeInsets.only(top: 50),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(top: 60, bottom: 20),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Center(
                            child: Text(
                          "3rd Standard:Start Learning Now!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        )),
                      ))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Youtube_Player(
                                videoID: const [
                                  'kQUG_S3dGF8',
                                  'BaO1E21SpkI',
                                  'xzZLdYd78_8',
                                  '_WoCV4c6XOE',
                                  'aT61nwd5U-s',
                                  'Hwr4gEHepOo',
                                ],
                              )));
                },
                child: Container(
                  height: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: shadowList,
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/4.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: const EdgeInsets.only(top: 50),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(top: 60, bottom: 20),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Center(
                            child: Text(
                          "4th Standard:Start Learning Now!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        )),
                      ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  _container(left, top, right, color, text, image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: left, right: right, top: top),
        height: 200,
        width: (MediaQuery.of(context).size.width - 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: (MediaQuery.of(context).size.width - 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
