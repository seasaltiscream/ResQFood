import 'package:flutter/material.dart';
import 'package:resqus/krispykremepage.dart';
import 'package:resqus/membership.dart';
import 'package:resqus/myorder.dart';
import 'package:resqus/nasigorengkaryo.dart';
import 'package:resqus/profile.dart';
import 'package:resqus/view_all.dart';
import 'package:resqus/voucherpage.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Placeholder(), // Home placeholder
    VoucherScreen(),
    MyOrder(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pages[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBackgroundCircle(context),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopRow(),
                  SizedBox(height: 20),
                  _buildSearchBox(),
                  SizedBox(height: 20),
                  _buildLocationRow(),
                  SizedBox(height: 10),
                  _buildInfoContainer(),
                  SizedBox(height: 10),
                  _buildMemberLevelContainer(context),
                  SizedBox(height: 20),
                  _buildStoresSection(context),
                  SizedBox(height: 20),
                  _buildStoreCard(
                    context,
                    'assets/krispykreme.jpg',
                    'Krispy Kreme',
                    '3 donuts left',
                    '20.000',
                    KrispyKremePage(),
                  ),
                  SizedBox(height: 10),
                  _buildStoreCard(
                    context,
                    'assets/nasigoreng.jpg',
                    'Nasi goreng Karyo',
                    '2 items left',
                    '12.000',
                    NasiGorengPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "ResQFood",
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 2,
      backgroundColor: Color(0xFF1A4D2E),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Color(0xFF1A4D2E),
        ),
      ),
    );
  }

  Positioned _buildBackgroundCircle(BuildContext context) {
    return Positioned(
      top: -MediaQuery.of(context).size.height * 0.7,
      left: -MediaQuery.of(context).size.width * 0.4,
      child: Container(
        width: MediaQuery.of(context).size.width * 1.8,
        height: MediaQuery.of(context).size.width * 1.8,
        decoration: BoxDecoration(
          color: Color(0xFF1A4D2E),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Row _buildTopRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Image.asset(
            'assets/food1.png',
            width: 60,
            height: 40,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "Every meal rescued through ResQFood contributes to a more sustainable food system",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Container _buildSearchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What do you want to eat today?',
          hintStyle: TextStyle(fontSize: 12),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
        onChanged: (query) {
          // Handle search logic here
          print("Search query: $query");
        },
      ),
    );
  }

  Column _buildLocationRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your location: ~2 KM',
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
        SizedBox(height: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_drop_down,
              color: Colors.blue,
            ),
            GestureDetector(
              onTap: () {
                // Implement location change logic
              },
              child: Text(
                'Change your location',
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildInfoContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color.fromRGBO(106, 153, 78, 1.0), width: 1),
      ),
      child: Row(
        children: [
          _buildInfoColumn('Point', 'assets/coin (1).png', '3000'),
          Container(
            height: 50,
            child: VerticalDivider(
              color: Colors.grey[350],
              thickness: 1,
            ),
          ),
          _buildInfoColumn('Voucher', 'assets/voucher.png', '2 Voucher'),
        ],
      ),
    );
  }

  Expanded _buildInfoColumn(String title, String assetPath, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                assetPath,
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildMemberLevelContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MembershipPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF1A4D2E),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/savior.png',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Member Level',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Savior Food',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }

  Row _buildStoresSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stores near you',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Try tasty food near you',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewAllPage()),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Color.fromRGBO(106, 153, 78, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'view all',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  GestureDetector _buildStoreCard(BuildContext context, String imagePath,
      String title, String subtitle, String price, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Picture
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Food Details
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Price
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(10),
              child: Text(
                price,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBottomNavigationBar() {
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
    );
  }
}
