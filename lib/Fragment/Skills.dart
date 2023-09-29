import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(
    home: SkillsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/Assets/images/222.jpg"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Card(
          color: Colors.cyan,
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 85, vertical: 30), // Adjust the margin as needed
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Skills",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo, // Customize the section title color
                  ),
                ),
                SizedBox(height: 12), // Add spacing below the title
                SkillCategory(
                  title: "Programming Languages",
                  skills: ["Kotlin", "Dart"], // Add more languages
                ),
                SkillCategory(
                  title: "Development Tools",
                  skills: ["Android Studio",], // Add more tools
                ),
                SkillCategory(
                  title: "UI Design",
                  skills: ["Flutter Widgets", "Figma"], // Add more UI tools
                ),
                SkillCategory(
                  title: "Architecture",
                  skills: ["Components", "MVC"], // Add more architecture patterns
                ),
                SkillCategory(
                  title: "Version Control",
                  skills: ["Git", "GitHub",], // Add more version control systems
                ),
                SkillCategory(
                  title: "API Integration",
                  skills: ["Retrofit", "HTTP",], // Add more integration tools
                ),
                SkillCategory(
                  title: "Testing",
                  skills: ["Debugging", "Unit Testing",], // Add more testing methods
                ),
                SizedBox(height: 12), // Add spacing below skills
                ElevatedButton(
                  onPressed: () {
                    _launchURL("https://drive.google.com/file/d/1-bb_M6MQ8z5WcSLNx4ZJ5UjAk9G2zY53/view?usp=drive_link"); // Replace with the URL to your CV
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo, // Customize the button's background color
                    onPrimary: Colors.white, // Customize the button's text color
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.download), // Add a download icon
                        SizedBox(width: 8), // Add spacing between the icon and text
                        Text(
                          "Download CV",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;

  const SkillCategory({
    required this.title,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: skills
              .map((skill) => Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "• $skill",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ))
              .toList(),
        ),
        SizedBox(height: 8), // Add spacing between skill categories
      ],
    );
  }
}
