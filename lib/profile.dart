// import 'package:flutter/material.dart';
// import 'package:resqus/account_safety.dart';
// import 'package:resqus/favorites.dart';
// import 'package:resqus/help_center.dart';
// import 'package:resqus/language.dart';
// import 'package:resqus/manage_account.dart';
// import 'package:resqus/myorder.dart';
// import 'package:resqus/notification.dart';
// import 'package:resqus/payment_method.dart';
// import 'package:resqus/promo_page.dart';
// import 'package:resqus/saved_address.dart';
// import 'package:resqus/voucherpage.dart';

// class AccountScreen extends StatefulWidget {
//   const AccountScreen({super.key});

//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }

// class _AccountScreenState extends State<AccountScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         // Stay on the current page
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => VoucherScreen()),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyOrder()),
//         );
//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AccountScreen()),
//         );
//         break;
//     }
//   }

// class _AccountScreenState extends State<AccountScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: const BackButton(),
//         title: const Text(
//           "Profile",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildProfileSection(),
//               const SizedBox(height: 16),
//               const Padding(
//                 padding: EdgeInsets.only(left: 8.0),
//                 child: Text(
//                   'My Account',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               _buildAccountButton(
//                 'My Order',
//                 const MyOrder(),
//               ),
//               _buildAccountButton(
//                 'Promos',
//                 PromoPage(),
//               ),
//               _buildAccountButton(
//                 'Payment Methods',
//                 const MyPaymentMethods(),
//               ),
//               _buildAccountButton(
//                 'Help Center',
//                 MyApp(),
//               ),
//               _buildAccountButton(
//                 'Change Language',
//                 Language(),
//               ),
//               _buildAccountButton(
//                 'Saved Addresses',
//                 const MySavedAddresses(),
//               ),
//               _buildAccountButton(
//                 'Notifications',
//                 const MyNotification(),
//               ),
//               _buildAccountButton(
//                 'Favorites',
//                 Favorites(),
//               ),
//               _buildAccountButton(
//                 'Account Safety',
//                 const MyAccSafety(),
//               ),
//               _buildAccountButton(
//                 'Manage Accounts',
//                 const MyManageAccount(),
//               ),
//             ],
//           ),
//         ),
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
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.local_offer),
//               label: 'Vouchers',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.receipt),
//               label: 'Orders',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle),
//               label: 'Profile',
//             ),
//           ],
//           selectedItemColor: Color(0xFF1A4D2E),
//           unselectedItemColor: Colors.grey,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//         ),
//     );
//   }

//   Widget _buildProfileSection() {
//     return Center(
//       child: Column(
//         children: [
//           SizedBox(
//             width: 120,
//             height: 120,
//             child: ClipOval(
//               child: Image.asset(
//                 'assets/max-verstappen-red-bull-racing.jpeg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'Taylor Swift',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             'taylorswift@gmail.com',
//             style: TextStyle(fontWeight: FontWeight.w100),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             '0812594876',
//             style: TextStyle(fontWeight: FontWeight.w100),
//           ),
//           const SizedBox(height: 16),
//           _buildProfileButton('You saved : 12 foods', () {}),
//           const SizedBox(height: 8),
//           _buildProfileButton('You Reduced : 137 kgCO2', () {}),
//         ],
//       ),
//     );
//   }

//   Widget _buildProfileButton(String text, VoidCallback onPressed) {
//     return SizedBox(
//       width: 350,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color.fromRGBO(106, 153, 78, 1.0),
//           foregroundColor: Colors.white,
//         ),
//         child: Text(text),
//       ),
//     );
//   }

//   Widget _buildAccountButton(String title, Widget? destination) {
//     return Container(
//       color: Colors.white,
//       child: SizedBox(
//         width: 950,
//         child: ElevatedButton(
//           onPressed: () {
//             if (destination != null) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => destination),
//               );
//             }
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             shadowColor: Colors.transparent,
//             elevation: 0,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(0),
//             ),
//             padding: EdgeInsets.zero,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Text(title),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(right: 8.0),
//                 child: Icon(Icons.chevron_right),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:resqus/account_safety.dart';
import 'package:resqus/favorites.dart';
import 'package:resqus/help_center.dart';
import 'package:resqus/language.dart';
import 'package:resqus/mainpage.dart';
import 'package:resqus/manage_account.dart';
import 'package:resqus/myorder.dart';
import 'package:resqus/notification.dart';
import 'package:resqus/payment_method.dart';
import 'package:resqus/promo_page.dart';
import 'package:resqus/saved_address.dart';
import 'package:resqus/voucherpage.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 3; // Set index to 3 for Profile page

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Mainpage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => VoucherScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyOrder()),
        );
        break;
      case 3:
        // Stay on the current page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 18),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileSection(),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'My Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              _buildAccountButton(
                'My Order',
                const MyOrder(),
              ),
              _buildAccountButton(
                'Promos',
                PromoPage(),
              ),
              _buildAccountButton(
                'Payment Methods',
                const MyPaymentMethods(),
              ),
              _buildAccountButton(
                'Help Center',
                MyApp(),
              ),
              _buildAccountButton(
                'Change Language',
                Language(),
              ),
              _buildAccountButton(
                'Saved Addresses',
                const MySavedAddresses(),
              ),
              _buildAccountButton(
                'Notifications',
                const MyNotification(),
              ),
              _buildAccountButton(
                'Favorites',
                Favorites(),
              ),
              _buildAccountButton(
                'Account Safety',
                const MyAccSafety(),
              ),
              _buildAccountButton(
                'Manage Accounts',
                const MyManageAccount(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Vouchers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color(0xFF1A4D2E),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipOval(
              child: Image.asset(
                'assets/max-verstappen-red-bull-racing.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Taylor Swift',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          const Text(
            'taylorswift@gmail.com',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          const SizedBox(height: 4),
          const Text(
            '0812594876',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          const SizedBox(height: 16),
          _buildProfileButton('You saved : 12 foods', () {}),
          const SizedBox(height: 8),
          _buildProfileButton('You Reduced : 137 kgCO2', () {}),
        ],
      ),
    );
  }

  Widget _buildProfileButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(106, 153, 78, 1.0),
          foregroundColor: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildAccountButton(String title, Widget? destination) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        width: 950,
        child: ElevatedButton(
          onPressed: () {
            if (destination != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
