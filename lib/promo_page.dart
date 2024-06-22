import 'package:flutter/material.dart';

class Promopage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promo Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PromoPage(),
    );
  }
}

class PromoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Promo Page',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PromoContainer(
                  title: "Pizza Marzano",
                  description: "Buy 1 Get 1 Free",
                  color: Colors.white,
                  imageAsset: 'assets/Marzano.jpg',
                  titleColor: Colors.grey[850]!,
                  descriptionColor: Color.fromRGBO(106, 153, 78, 1.0),
                  buttonColor: Color(0xFF1A4D2E),
                ),
                SizedBox(height: 20),
                PromoContainer(
                  title: "J.Co",
                  description: "Buy 12 Get 12 Free",
                  color: Colors.white,
                  imageAsset: 'assets/Jco.jpg',
                  titleColor: Colors.grey[850]!,
                  descriptionColor: Color.fromRGBO(106, 153, 78, 1.0),
                  buttonColor: Color(0xFF1A4D2E),
                ),
                SizedBox(height: 20),
                PromoContainer(
                  title: "Krispy Kreme",
                  description: "Discount up to 99%",
                  color: Colors.white,
                  imageAsset: 'assets/Krispy.jpg',
                  titleColor: Colors.grey[850]!,
                  descriptionColor: Color.fromRGBO(106, 153, 78, 1.0),
                  buttonColor: Color(0xFF1A4D2E),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PromoContainer extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final String imageAsset;
  final Color titleColor;
  final Color descriptionColor;
  final Color buttonColor;

  PromoContainer({
    required this.title,
    required this.description,
    required this.color,
    required this.imageAsset,
    required this.titleColor,
    required this.descriptionColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              color: Colors.white,
              child: Image.asset(
                imageAsset,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: descriptionColor,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        backgroundColor: buttonColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
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
