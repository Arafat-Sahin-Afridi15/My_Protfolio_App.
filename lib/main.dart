import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/Fragment/Skills.dart';
import 'package:portfolio/Fragment/Experiences.dart';
import 'package:portfolio/Fragment/About.dart';
import 'package:portfolio/Fragment/Education.dart';
import 'package:portfolio/Fragment/Calculator.dart';
import 'package:portfolio/Fragment/Quiz.dart';
import 'package:portfolio/Fragment/m_app_weather_app.dart';
import 'package:portfolio/Fragment/Profile.dart'; // Import the Profile widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Portfolio",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                text: 'About Me',
              ),
              Tab(
                icon: Icon(
                  Icons.cast_for_education,
                  color: Colors.white,
                ),
                text: 'Education',
              ),
              Tab(
                icon: Icon(
                  Icons.emoji_objects,
                  color: Colors.white,
                ),
                text: 'My Skills',
              ),
              Tab(
                icon: Icon(
                  Icons.work,
                  color: Colors.white,
                ),
                text: 'Experience',
              ),
              Tab(
                icon: Icon(
                  Icons.calculate,
                  color: Colors.white,
                ),
                text: 'Calculator',
              ),
              Tab(
                icon: Icon(
                  Icons.quiz,
                  color: Colors.white,
                ),
                text: 'Quiz',
              ),
              Tab(
                icon: Icon(
                  Icons.water,
                  color: Colors.white,
                ),
                text: 'Weather',
              ),
              Tab(
                icon: Icon(
                  Icons.person_off,
                  color: Colors.white,
                ),
                text: 'Profile',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  accountName: const Text(
                    "Arafat Sahin Afridi",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  accountEmail: const Text(
                    "sahin15-3971@diu.edu.bd",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  currentAccountPicture: Image.network(
                      "https://media.licdn.com/dms/image/D5603AQEdlhtePGq6LA/profile-displayphoto-shrink_800_800/0/1694440300604?e=2147483647&v=beta&t=GetQM_PzOW44r7S0-67hY1bv6ar8XGn0pR9IDv3YWA0"),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  // Handle Home navigation here
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Gmail',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  // Open the email app when tapped
                  launch('https://mail.google.com/mail/u/0/#inbox');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.link,
                  color: Colors.blue,
                ),
                title: const Text(
                  'LinkedIn',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  // Open the LinkedIn profile when tapped
                  launch('https://bd.linkedin.com/in/arafat-sahin-afridi-a76287247');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.facebook,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Facebook',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  // Open the Facebook profile when tapped
                  launch('https://www.facebook.com/arafatsahin.afridi?mibextid=ZbWKwL');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Instagram',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  // Open the Instagram profile when tapped
                  launch('https://www.instagram.com/arafatafridi2001/?igshid=OGQ5ZDc2ODk2ZA%3D%3D');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.gite,
                  color: Colors.blue,
                ),
                title: const Text(
                  'GitHub',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  // Open the GitHub profile when tapped
                  launch('https://github.com/Arafat-Sahin-Afridi15');
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            About(),
            Education(),
            SkillsScreen(),
            Experiences(),
            Calculator(),
            Quiz(),
            WeatherScreen(),
            Profile(),// Use the Quiz widget here
          ],
        ),
      ),
    );
  }
}
