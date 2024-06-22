import 'package:flutter/material.dart';

class MyDeliv extends StatefulWidget {
  const MyDeliv({super.key});

  @override
  State<MyDeliv> createState() => _MyDeliv();
}

class _MyDeliv extends State<MyDeliv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(),
        title: const Text(
          'Status Order',
          style: TextStyle(fontSize: 18),
        ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SizedBox(height: 40),
            DeliveryStatusCard(),
            SizedBox(height: 20),
            DriverInfoCard(),
            SizedBox(height: 20),
            OrderDetailsCard(),
          ],
        ),
      ),
    );
  }
}

class DeliveryStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 217, 217, 217)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.delivery_dining, color: Colors.green[900]),
                SizedBox(width: 8),
                Text(
                  'Saver Delivery',
                  style: TextStyle(
                      color: Colors.green[900], fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '8:57 - 9:34 PM',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Kitchen\'s preparing your order',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              'We\'ll let you know when it\'s out for delivery.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class DriverInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 217, 217, 217)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('Images/user.png'),
              radius: 30,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RAVEL SKIBIDI',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text('5.0'),
                  ],
                ),
                Text('YAMAHA OHIO • B 6666 MLG'),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 217, 217, 217)),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.restaurant, color: Colors.green[900]),
              SizedBox(width: 8),
              Text(
                '2x Burger',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.local_drink, color: Colors.green[900]),
              SizedBox(width: 8),
              Text(
                '1x Coke',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.fastfood, color: Colors.green[900]),
              SizedBox(width: 8),
              Text(
                '1x Fries',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
