import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
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
            "Help Center",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10), // Add some space above the texts
              Text(
                'Welcome to ResQFood Support',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF1A4D2E),
                ),
              ),
              Text(
                'FAQ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 350,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF1A4D2E),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'How do I place an order?',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF1A4D2E),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'What Payment Method ResQFood Accept?',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF1A4D2E),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'What if there is an issue with my order?',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF1A4D2E),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'How do I track my order?',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF1A4D2E),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'Can I schedule a food delivery in advance?',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 350,
                          height: 250,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            '> Browse restaurants, select items, and complete an order using the ResQFood app.\n'
                            '> ResQFood accepts payment using GoPay, OVO, Dana, QRIS, and Cash.\n'
                            '> You can contact our live support if there\'s an issue with any order.\n'
                            '> You should see information such as the restaurant\'s preparation time, estimated delivery time, and the current status of your order.\n'
                            '> For now, our application cannot schedule a food delivery in advance.',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
