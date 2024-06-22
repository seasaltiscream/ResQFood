import 'package:flutter/material.dart';

class MyAccSafety extends StatefulWidget {
  const MyAccSafety({super.key});

  @override
  State<MyAccSafety> createState() => _MyAccSafety();
}

class _MyAccSafety extends State<MyAccSafety> {
  bool isTwoLayerProtectionEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Account Safety",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            // Divider(height: 1, color: Colors.grey),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Two Layer Protection',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Log in with added security'),
              trailing: Switch(
                value: isTwoLayerProtectionEnabled,
                onChanged: (value) {
                  setState(() {
                    isTwoLayerProtectionEnabled = value;
                  });
                },
                activeColor: Colors.green,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey,
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Trusted Devices',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Login shortcuts for devices you own'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Trusted Devices screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Login History',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Track device name, location, and date'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Login History screen
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
