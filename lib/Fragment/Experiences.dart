import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Experiences extends StatelessWidget {
  const Experiences({Key? key});

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
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Company SOFTOPARK IT LTD - Mobile App Developer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sept 2021 - Present",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 12), // Increase the space between date and description
                Text(
                  "As a mobile app developer at Company SOFTOPARK IT LTD, I have created software for phones and tablets, staying up-to-date with the latest mobile technologies. This role has required me to optimize performance, battery usage, network efficiency, and memory management to deliver high-quality mobile applications.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "3 years of experience",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add an action for the button, e.g., navigate to your portfolio
                    // You can use navigation techniques such as Navigator to go to your portfolio screen.
                    // For example:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PortfolioScreen(), // Replace PortfolioScreen with your actual portfolio screen widget
                      ),
                    );
                  },
                  child: Text("View Project"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Increase button padding
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  final List<ProjectItem> projects = [
    ProjectItem(
      title: "Calculetor App", // Replace with the image path for Project 1
      technologies: ["Flutter", "Dart", "Firebase"], // List of technologies used
      link: "https://github.com/Arafat-Sahin-Afridi15/Calculetoe_App_flutter_Arafat.git", // Link to the project repository
    ),
    ProjectItem(
      title: "Student Management System", // Replace with the image path for Project 2
      technologies: ["Python", "Sql", "MongoDB"], // List of technologies used
      link: "https://github.com/Arafat-Sahin-Afridi15/Resturaunt-Management-", // Link to the project repository
    ),
    ProjectItem(
      title: "Librariry Manegement System ",

      technologies: ["Java"], // List of technologies used
      link: "https://github.com/Arafat-Sahin-Afridi15/Basic_App", // Link to the project repository
    ),
    ProjectItem(
      title: "My_Protfolio_App",

      technologies: ["Flutter", "Dart", "Firebase"], // List of technologies used
      link: "https://github.com/Arafat-Sahin-Afridi15/My_Protfolio_App./tree/master", // Link to the project repository
    ),
    // Add more project items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects"),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ProjectCard(project: project);
        },
      ),
    );
  }
}

class ProjectItem {
  final String title;

  final List<String> technologies;
  final String link;

  ProjectItem({
    required this.title,


    required this.technologies,
    required this.link,
  });
}

class ProjectCard extends StatelessWidget {
  final ProjectItem project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Technologies Used: ${project.technologies.join(', ')}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    launch(project.link); // Opens the project link in a web browser
                  },
                  child: Text("View Project"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
