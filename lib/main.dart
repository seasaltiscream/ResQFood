import 'package:flutter/material.dart';
import 'package:resqus/login.dart';
import 'package:resqus/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1A4D2E),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Circular background
            Positioned(
              top: -MediaQuery.of(context).size.height * 0.2,
              left: -MediaQuery.of(context).size.width * 0.3,
              child: Container(
                width: MediaQuery.of(context).size.width * 1.6,
                height: MediaQuery.of(context).size.width * 1.6,
                decoration: BoxDecoration(
                  color: Color(0xFF1A4D2E),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Main content
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.fromLTRB(30, 80, 30, 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/chef.png"),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "ResQFood",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Minimize Waste.  Maximize Taste",
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: <Widget>[
                      //LOGIN BUTTON
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        color: Color(0xFF1A4D2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //SIGNUP BUTTON
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        //define shape
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFF1A4D2E)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
