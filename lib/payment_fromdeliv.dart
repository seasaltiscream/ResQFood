import 'package:flutter/material.dart';

class MyPayment extends StatefulWidget {
  const MyPayment({super.key});

  @override
  State<MyPayment> createState() => _MyPayment();
}

class _MyPayment extends State<MyPayment> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(thickness: 1), // Add a Divider right below the AppBar
          Expanded(
            child: SingleChildScrollView(
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
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 45),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0), // Add padding to the left
                      child: Text(
                        'Digital Payments',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        RadioListTile<String>(
                          title: Row(
                            children: [
                              Image.asset('assets/logo-gopay.jpg',
                                  width: 70, height: 70),
                              SizedBox(width: 8),
                              //Text('GoPay'),
                            ],
                          ),
                          value: 'gopay',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Row(
                            children: [
                              Image.asset('assets/logo-ovo.jpg',
                                  width: 70, height: 70),
                              SizedBox(width: 8),
                              //Text('OVO'),
                            ],
                          ),
                          value: 'OVO',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Row(
                            children: [
                              Image.asset('assets/logo-dana.jpg',
                                  width: 70, height: 70),
                              SizedBox(width: 8),
                              //Text('DANA'),
                            ],
                          ),
                          value: 'DANA',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Row(
                            children: [
                              Image.asset('assets/logo-qris.jpg',
                                  width: 70, height: 70),
                              SizedBox(width: 8),
                              //Text('QRIS'),
                            ],
                          ),
                          value: 'QRIS',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0), // Add padding to the left
                          child: Text(
                            'Other Payments',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                        RadioListTile<String>(
                          title: Text(
                            'Cash',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          value: 'Cash',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
