import 'package:flutter/material.dart';
import 'package:resqus/login.dart';
import 'package:resqus/main.dart';

class MyManageAccount extends StatefulWidget {
  const MyManageAccount({super.key});

  @override
  State<MyManageAccount> createState() => _MyMyManageAccount();
}

class _MyMyManageAccount extends State<MyManageAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Manage Account",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        //line under header
        children: [
          Container(
            // height: 2,
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/max-verstappen-red-bull-racing.jpg'),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  buildDetailField('Name', 'Taylor Swift', context),
                  buildDetailField('Email', 'taylor.swift@gmail.com', context),
                  buildDetailField('Phone Number', '082536836625', context),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      // Add your logout action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700], // Background color
                    ),
                    child: Text(
                      'Log out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailField(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    value,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Add your edit detail action here
              },
              child: Text(
                'edit detail',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
