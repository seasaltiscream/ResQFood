// import 'package:flutter/material.dart';
// import 'package:resqus/mainpage.dart';
// // import 'main_page.dart'; // Import your main page

// class MyOrder extends StatefulWidget {
//   const MyOrder({super.key});

//   @override
//   State<MyOrder> createState() => _MyOrder();
// }

// class _MyOrder extends State<MyOrder> {
//   final List<Order> orders = [
//     Order(
//       date: '29 April, 19:54',
//       name: 'Krispy Kreme',
//       price: 'Rp 20.000',
//       status: 'Order Delivered',
//       imageUrl: 'assets/krispykreme.jpg', // Replace with your image assets
//     ),
//     Order(
//       date: '1 April, 16:46',
//       name: 'Nasi Goreng Karyo',
//       price: 'Rp 12.000',
//       status: 'Order Delivered',
//       imageUrl: 'assets/nasigoreng.jpg', // Replace with your image assets
//     ),
//     Order(
//       date: '16 March, 12:03',
//       name: 'Pizza Marzano',
//       price: 'Rp 30.000',
//       status: 'Order cancelled',
//       imageUrl: 'assets/Marzano.jpg', // Replace with your image assets
//     ),
//     Order(
//       date: '3 March, 14:30',
//       name: 'J.Co',
//       price: 'Rp 20.000',
//       status: 'Order Delivered',
//       imageUrl: 'assets/jco.jpeg', // Replace with your image assets
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           AppBar(
//             backgroundColor: Colors.white,
//             title: Text(
//               "My Order",
//               style: TextStyle(fontSize: 18, color: Colors.black),
//             ),
//             iconTheme: IconThemeData(color: Colors.black),
//           ),
//           // Divider(
//           //   height: 1,
//           //   color: Colors.grey,
//           // ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: orders.length,
//               itemBuilder: (context, index) {
//                 final order = orders[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 8.0), // Add padding here
//                   child: OrderItem(order: order),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 1,
//               blurRadius: 8,
//               offset: Offset(0, -1),
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           selectedItemColor: Color(0xFF1A4D2E),
//           unselectedItemColor: Colors.black,
//           showUnselectedLabels: true,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.card_giftcard),
//               label: 'Voucher',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.receipt),
//               label: 'Orders',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//           onTap: (index) {
//             if (index == 0) {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => Mainpage()),
//               );
//             } else if (index == 1) {
//               // Navigate to Voucher screen
//             } else if (index == 2) {
//               // Stay on the current page
//             } else if (index == 3) {
//               // Navigate to Profile screen
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class Order {
//   final String date;
//   final String name;
//   final String price;
//   final String status;
//   final String imageUrl;

//   Order({
//     required this.date,
//     required this.name,
//     required this.price,
//     required this.status,
//     required this.imageUrl,
//   });
// }

// class OrderItem extends StatelessWidget {
//   final Order order;

//   const OrderItem({required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(
//                 8.0), // Adjust the border radius for rounded corners
//             child: Image.asset(order.imageUrl,
//                 width: 60,
//                 height: 60,
//                 fit: BoxFit.cover), // Adjust the width and height as needed
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(order.name, style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text(order.date),
//                 Text(
//                   order.status,
//                   style: TextStyle(
//                       color: order.status == 'Order Delivered'
//                           ? Colors.green
//                           : Colors.red,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.only(right: 10.0), // Adjust the padding here
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(order.price),
//                 SizedBox(height: 4),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Reorder',
//                     style: TextStyle(
//                         color: Colors.white), // Set text color to white
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromRGBO(106, 153, 78, 1.0),
//                     minimumSize: Size(70, 30), // Adjust button size if needed
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:resqus/mainpage.dart';
import 'package:resqus/voucherpage.dart';
import 'package:resqus/profile.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final List<Order> orders = [
    Order(
      date: '29 April, 19:54',
      name: 'Krispy Kreme',
      price: 'Rp 20.000',
      status: 'Order Delivered',
      imageUrl: 'assets/krispykreme.jpg',
    ),
    Order(
      date: '1 April, 16:46',
      name: 'Nasi Goreng Karyo',
      price: 'Rp 12.000',
      status: 'Order Delivered',
      imageUrl: 'assets/nasigoreng.jpg',
    ),
    Order(
      date: '16 March, 12:03',
      name: 'Pizza Marzano',
      price: 'Rp 30.000',
      status: 'Order cancelled',
      imageUrl: 'assets/Marzano.jpg',
    ),
    Order(
      date: '3 March, 14:30',
      name: 'J.Co',
      price: 'Rp 20.000',
      status: 'Order Delivered',
      imageUrl: 'assets/jco.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Order",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.5),
              child: OrderItem(order: order),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF1A4D2E),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: 2, // Highlight the Orders tab
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Mainpage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => VoucherScreen()),
            );
          } else if (index == 2) {
            // Stay on the current page
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AccountScreen()),
            );
          }
        },
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
            icon: Icon(Icons.receipt),
            label: 'Orders',
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

class Order {
  final String date;
  final String name;
  final String price;
  final String status;
  final String imageUrl;

  Order({
    required this.date,
    required this.name,
    required this.price,
    required this.status,
    required this.imageUrl,
  });
}

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              order.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  order.date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  order.status,
                  style: TextStyle(
                    color: order.status == 'Order Delivered'
                        ? const Color.fromARGB(255, 85, 144, 87)
                        : const Color.fromARGB(255, 203, 88, 80),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                order.price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(height: 4),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Reorder',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(106, 153, 78, 1.0),
                  minimumSize: Size(50, 20),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
