import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Favorites",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Add padding to the whole body
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align at the top
            children: <Widget>[
              // First Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // First Container with curve, outline, and shadow
                  buildFavoriteContainer('assets/Marzano.jpg', 'Pizza Marzano'),
                  SizedBox(width: 20), // Spacer between the containers
                  // Second Container with curve, outline, and shadow
                  buildFavoriteContainer('assets/Krispy.jpg', 'Krispy Kreme'),
                ],
              ),
              SizedBox(height: 20), // Spacer between the rows
              // Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Third Container with curve, outline, and shadow
                  buildFavoriteContainer('assets/Jco.jpg', 'J.Co'),
                  SizedBox(width: 20), // Spacer between the containers
                  // Fourth Container with curve, outline, and shadow
                  buildFavoriteContainer('assets/dunkin.jpg', 'Dunkin'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFavoriteContainer(String imagePath, String title) {
    return Container(
      width: 160,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(Icons.star, color: Colors.yellow, size: 20),
                SizedBox(width: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'View Store',
              style: TextStyle(
                  fontSize: 14, color: const Color.fromARGB(255, 0, 126, 4)),
            ),
          ],
        ),
      ),
    );
  }
}
