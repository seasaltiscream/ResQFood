import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resqus/mainpage.dart';
import 'package:resqus/myorder.dart';
import 'package:resqus/profile.dart';
import 'package:resqus/voucher_singleitemscreen.dart';

class VoucherScreen extends StatefulWidget {
  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Voucher",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoColumn('Point', 'assets/point.png', '3000'),
                    _buildInfoColumn(
                        'Member Level', 'assets/member.png', 'Savior Food'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: [
                  ItemsWidget(),
                  ItemsWidget(),
                  ItemsWidget(),
                  ItemsWidget(),
                ][_tabController.index],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Column _buildInfoColumn(String title, String assetPath, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              assetPath,
              width: 24,
              height: 24,
            ),
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF393939),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 5),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
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
        selectedItemColor: Color(0xFF1A4D2E),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: 1, // Highlight the Voucher tab
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Mainpage()),
            );
          } else if (index == 1) {
            // Stay on the current page
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyOrder()),
            );
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
            icon: Icon(Icons.local_offer),
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

class ItemsWidget extends StatelessWidget {
  final List<String> img = [
    'Voucher Free Tumbler',
    'Discount 50%',
    'Discount 30%',
    'Voucher Free Tote Bag'
  ];

  final List<int> points = [1000, 65, 30, 750];
  final List<String> descriptions = [
    "Enjoy a Free Tumbler Voucher by Exchanging 1000 Points!\n\n"
        "1. Voucher can be redeemed using a minimum of 1000 points.\n"
        "2. Voucher can be used to receive one (1) exclusive tumbler from ResQFood.\n"
        "3. Voucher is valid for one (1) transaction per period.\n"
        "4. Voucher is available to all registered members on the ResQFood platform.\n"
        "5. Voucher cannot be combined with other promotions or vouchers.\n"
        "6. Limited voucher quota, redeem your points now!",
    "Enjoy a 50% Discount Voucher by Exchanging 65 Points!\n\n"
        "1. Voucher can be redeemed using a minimum of 65 points.\n"
        "2. Voucher can be used to receive one (1) a 50% discount from ResQFood.\n"
        "3. Voucher is valid for one (1) transaction per period.\n"
        "4. Voucher is available to all registered members on the ResQFood platform.\n"
        "5. Voucher cannot be combined with other promotions or vouchers.\n"
        "6. Limited voucher quota, redeem your points now!",
    "Enjoy a 30% Discount Voucher by Exchanging 30 Points!\n\n"
        "1. Voucher can be redeemed using a minimum of 30 points.\n"
        "2. Voucher can be used to receive a 30% discount from ResQFood.\n"
        "3. Voucher is valid for one (1) transaction per period.\n"
        "4. Voucher is available to all registered members on the ResQFood platform.\n"
        "5. Voucher cannot be combined with other promotions or vouchers.\n"
        "6. Limited voucher quota, redeem your points now!",
    "Enjoy a Free Tote Bag Voucher by Exchanging 750 Points!\n\n"
        "1. Voucher can be redeemed using a minimum of 750 points.\n"
        "2. Voucher can be used to receive one (1) exclusive tote bag from ResQFood.\n"
        "3. Voucher is valid for one (1) transaction per period.\n"
        "4. Voucher is available to all registered members on the ResQFood platform.\n"
        "5. Voucher cannot be combined with other promotions or vouchers.\n"
        "6. Limited voucher quota, redeem your points now!"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 210),
      children: List.generate(img.length, (i) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 7),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleItemScreen(
                        img[i],
                        points[i],
                        descriptions[i],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/${img[i]}.png",
                    width: 145,
                    height: 145,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Transform.translate(
                offset: Offset(5, 0),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          img[i],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F2F2F),
                          ),
                        ),
                      ),
                      Text(
                        "${points[i]} Points",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6A994E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
