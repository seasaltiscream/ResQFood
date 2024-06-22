import 'package:flutter/material.dart';

class MyPaymentMethods extends StatefulWidget {
  const MyPaymentMethods({super.key});

  @override
  State<MyPaymentMethods> createState() => _MyPaymentMethods();
}

class _MyPaymentMethods extends State<MyPaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Payment Method",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Divider(height: 1, thickness: 1), // Divider line under the header
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0), // Add padding to the left
                    child: Text(
                      'There are no saved payment methods associated with this account.',
                      style: TextStyle(
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(
                      height: 20,
                      thickness: 1), // Divider line under the first text
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0), // Add padding to the left
                    child: Text(
                      'Please Select your payment method',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0), // Add padding to the left
                    child: Text(
                      'Digital Payments',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  // Text(
                  //   'Please Select your payment method',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  // ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        PaymentMethodItem(
                          logo:
                              'assets/logo-gopay.jpg', // Replace with your asset path
                        ),
                        SizedBox(height: 10),
                        PaymentMethodItem(
                          logo:
                              'assets/logo-ovo.jpg', // Replace with your asset path
                        ),
                        SizedBox(height: 10),
                        PaymentMethodItem(
                          logo:
                              'assets/logo-dana.jpg', // Replace with your asset path
                        ),
                        SizedBox(height: 10),
                        PaymentMethodItem(
                          logo:
                              'assets/logo-qris.jpg', // Replace with your asset path
                        ),
                      ],
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
}

class PaymentMethodItem extends StatelessWidget {
  final String logo;
  //final String name;

  // class PaymentMethodItem extends StatelessWidget {
  // final String logo;
  // final String name; // code ori

  PaymentMethodItem({required this.logo});
  //PaymentMethodItem({required this.logo, required this.name}); // code ori

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(logo, width: 80, height: 80),
      trailing: ElevatedButton(
        onPressed: () {
          // Add your link functionality here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(
              106, 153, 78, 1.0), // Set the background color to green
        ),
        child: Text(
          'Link',
          style: TextStyle(color: Colors.white), // Set the text color to black
        ),
      ),
    );
  }
}
