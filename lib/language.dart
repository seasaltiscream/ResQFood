import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Add this line to remove the debug banner
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Change Language",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildRow('English', 'assets/english.png', 'Indonesia',
                  'assets/indonesia.png'),
              SizedBox(height: 20), // Adds space between the rows
              buildRow('India', 'assets/India.png', 'Japanese',
                  'assets/Japanese.png'),
              SizedBox(height: 20), // Adds space between the rows
              buildRow('Chinese', 'assets/Chinese.png', 'Arabic',
                  'assets/Arabic.png'),
              SizedBox(height: 20), // Adds space between the rows
              buildRow('Korean', 'assets/Korean.png', 'Russian',
                  'assets/Russian.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(
      String text1, String imagePath1, String text2, String imagePath2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildContainer(text1, imagePath1, Colors.white),
        SizedBox(width: 50), // Adds space between the containers
        buildContainer(text2, imagePath2, Colors.white),
      ],
    );
  }

  Widget buildContainer(String text, String imagePath, Color color) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20), // Curved borders
        border: Border.all(
          color: Colors.grey, // Outline color
          width: 1, // Increased outline width
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10), // Adds space between the text and the image
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 65, // Increased width
              height: 65, // Increased height
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
