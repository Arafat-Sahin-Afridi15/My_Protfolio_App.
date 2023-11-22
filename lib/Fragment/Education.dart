import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/Assets/images/222.jpg"), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child: Card(
        color: Colors.cyan,
        elevation: 4,
        margin:EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Education",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, // Customize the section title color
                ),
              ),
              SizedBox(height: 8), // Add spacing below the title
              Text(
                "Bachelor of Science in Computer Science",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Daffodil International University",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12), // Increase the space between degree and relevant courses
              Text(
                "Relevant Courses:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, // Customize the course title color
                ),
              ),
              Text(
                "Data Structures, Algorithms, Mobile App Development, Web Programming, Software Engineering",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12), // Increase the space between courses and honors
              Text(
                "Honors:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, // Customize the honors title color
                ),
              ),
              Text(
                "Dean's List (Every Semester)",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16), // Add spacing between sections

              // Secondary School Certificate (SSC) Section
              Text(
                "SSC (Secondary School Certificate)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, // Customize the section title color
                ),
              ),
              Text(
                "All- helal Islami Academy",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                "Passing Year: 2017",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                "GPA=4.95",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              // Higher Secondary School Certificate (HSC) Section
              SizedBox(height: 12), // Add spacing between SSC and HSC sections
              Text(
                "HSC (Higher Secondary School Certificate)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, // Customize the section title color
                ),
              ),
              Text(
                "Rajsahi Model School & Collage",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                "Passing Year: 2019",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                "GPA=4.8",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  // Show the certificate when the button is pressed
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Certificate"),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Add your certificate image or content here
                              // For example, you can use an Image widget to display an image
                              Image.asset(
                                "lib/Assets/images/ct1.jpg", // Replace with your certificate image path
                                width: 200, // Set the width to your preferred size
                              ),

                              Image.asset(
                                "lib/Assets/images/ct2.jpg", // Replace with your certificate image path
                                width: 200, // Set the width to your preferred size
                              ),
                              Image.asset(
                                "lib/Assets/images/ct3.jpg", // Replace with your certificate image path
                                width: 200, // Set the width to your preferred size
                              ),
                              SizedBox(height: 20), // Add spacing
                              Text(
                                "Certificate of Achievement",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "This is to certify that...",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              // Close the dialog when the "Close" button is pressed
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("View Certificate"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Increase button padding
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
