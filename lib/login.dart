import 'package:flutter/material.dart';
import 'package:resqus/main.dart';
import 'package:resqus/mainpage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, backgroundColor: Color(0xFF1A4D2E)),
      body: Stack(
        children: [
          // Circular background
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.6,
            left: -MediaQuery.of(context).size.width * 0.4,
            child: Container(
              width: MediaQuery.of(context).size.width * 1.8,
              height: MediaQuery.of(context).size.width * 1.8,
              decoration: BoxDecoration(
                color: Color(0xFF1A4D2E),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Main content
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
                            child: Text(
                              "Welcome Back!",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Upper text

                          SizedBox(height: 20),
                          Text(
                            "Discover discounted surplus meals from nearby eateries, \nreducing food waste while saving money.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[300],
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      // Input boxes
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                            inputFile(label: "Username"),
                            inputFile(label: "Password", obscureText: true),
                          ],
                        ),
                      ),
                      // Login button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(top: 5, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 40,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mainpage()),
                              );
                            },
                            color: Color(0xFF1A4D2E),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?"),
                          Text(
                            " Sign Up Here",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.blue[200],
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 100),
                        height: 200,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 5),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
