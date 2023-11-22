import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: About(),
    debugShowCheckedModeBanner: false,
  ));
}

class About extends StatelessWidget {
  const About({Key? key});

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
        margin:EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        "lib/Assets/images/imresizer-1686153196351.jpg"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Arafat Sahin Afridi",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: "Roboto",
                        ),
                      ),
                      Text(
                        "Android Developer",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Roboto",
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black), // Add a divider
              const SizedBox(height: 10),
              const Text(
                "Bio",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "Roboto",
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "I'm Arafat, a dedicated learner with a strong academic background. I graduated from All-Helala Isalami Academy School & College in 2017 with a GPA of 4.95 and from Rajshahi Model School & College in 2019 with a GPA of 4.8. Currently pursuing a B.Sc. in Computer Science and Engineering at Daffodil International University, I'm passionate about exploring technology's creative potential.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "Roboto",
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.red), // Add another divider
              const SizedBox(height: 10),
              const Text(
                "Contact Information",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "Roboto",
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.location_pin,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Dhaka, Savar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "sahin15-3971@diu.edu.bd",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.phone,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "01774534199",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.language,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "www.https://arafatsahin.com", // Add your website link here
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
