// import 'package:flutter/material.dart';
// import 'package:resqus/payment_fromdeliv.dart';

// class DeliveryPickupScreen extends StatefulWidget {
//   final Map<String, int> selectedItems;

//   DeliveryPickupScreen({required this.selectedItems});

//   @override
//   State<DeliveryPickupScreen> createState() => _DeliveryPickupScreenState();
// }

// class _DeliveryPickupScreenState extends State<DeliveryPickupScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
//     _tabController.addListener(_handleTabSelection);
//   }

//   void _handleTabSelection() {
//     if (_tabController.indexIsChanging) {
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildImageWithSearchBar(context),
//             _buildTabBar(),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   TabContent1(selectedItems: widget.selectedItems),
//                   TabContent2(selectedItems: widget.selectedItems),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildImageWithSearchBar(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: 300,
//           child: Image.asset('assets/map.jpeg', fit: BoxFit.cover),
//         ),
//         Positioned(
//           top: 20,
//           left: 15,
//           right: 15,
//           child: Container(
//             height: 60,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(50),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back, color: Colors.black),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Search here",
//                       hintStyle: TextStyle(color: Colors.grey),
//                       contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: Icon(Icons.search, size: 30, color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTabBar() {
//     return TabBar(
//       controller: _tabController,
//       labelColor: Color.fromRGBO(106, 153, 78, 1.0),
//       unselectedLabelColor: Colors.black,
//       isScrollable: true,
//       indicator: UnderlineTabIndicator(
//         borderSide:
//             BorderSide(width: 3, color: Color.fromRGBO(106, 153, 78, 1.0)),
//         insets: EdgeInsets.symmetric(horizontal: 10),
//       ),
//       labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//       labelPadding: EdgeInsets.symmetric(horizontal: 37),
//       tabs: [
//         Tab(text: "Self Pickup"),
//         Tab(text: "Delivery"),
//       ],
//     );
//   }
// }

// class TabContent1 extends StatelessWidget {
//   final Map<String, int> selectedItems;

//   TabContent1({required this.selectedItems});

//   @override
//   Widget build(BuildContext context) {
//     var filteredItems =
//         selectedItems.entries.where((entry) => entry.value > 0).toList();

//     return ListView(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       children: [
//         SizedBox(height: 20), // Added space at the top
//         _buildSectionTitle("Pickup Location"),
//         SizedBox(height: 10), // Space between title and content
//         _buildLocationInfo(),
//         SizedBox(height: 20), // Space between sections
//         _buildPickupTimeInfo(),
//         Divider(color: Colors.grey, thickness: 1),
//         SizedBox(height: 20), // Space between sections
//         _buildOrderSummaryHeader(),
//         SizedBox(height: 10), // Space between header and content
//         _buildOrderSummary(),
//         ...filteredItems
//             .map((entry) => _buildOrderItem(
//                 entry.key, entry.value.toString(), "Rp${entry.value * 20000}"))
//             .toList(),
//         Divider(color: Colors.grey, thickness: 1),
//         SizedBox(height: 20), // Space between sections
//         _buildSectionTitle("Payment Details"),
//         SizedBox(height: 10), // Space between title and content
//         _buildPaymentOption(context, Icons.credit_card, "Payment Methods",
//             Colors.blue, MyPayment()),
//         _buildPaymentOption(context, Icons.card_giftcard_outlined,
//             "Use Voucher", Colors.yellow, null),
//         SizedBox(height: 20), // Space before order total
//         _buildOrderTotal("  Order",
//             "Rp ${filteredItems.map((e) => e.value * 20000).reduce((a, b) => a + b)}  "),
//         SizedBox(height: 20), // Space at the bottom
//       ],
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _buildLocationInfo() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.grey.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Image.asset('assets/location.png', width: 50, height: 50),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               "MJWV+9JG, Jl. BSD Raya Utama, Pagedangan, Kec. Pagedangan, Kabupaten Tangerang, Banten 15345",
//               style: TextStyle(fontSize: 16, color: Colors.grey[850]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPickupTimeInfo() {
//     return Container(
//       padding: EdgeInsets.all(10),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//           color: Colors.lightBlue.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(10)),
//       child: RichText(
//         textAlign: TextAlign.center,
//         text: TextSpan(
//           style: TextStyle(fontSize: 16, color: Colors.black),
//           children: [
//             TextSpan(text: "Order can be picked up today at "),
//             TextSpan(
//                 text: "12.00 - 20.00",
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOrderSummaryHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         children: [
//           Text("Order Summary",
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold)),
//           Spacer(),
//           Text("Add more",
//               style: TextStyle(
//                   fontSize: 16, color: Color.fromRGBO(106, 153, 78, 1.0))),
//         ],
//       ),
//     );
//   }

//   Widget _buildOrderSummary() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         "Krispy Kreme",
//         style: TextStyle(fontSize: 16),
//       ),
//     );
//   }

//   Widget _buildOrderItem(String itemName, String quantity, String price) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(itemName, style: TextStyle(fontSize: 16, color: Colors.black)),
//           Row(
//             children: [
//               Text("$quantity x",
//                   style: TextStyle(fontSize: 16, color: Colors.black)),
//               SizedBox(width: 10),
//               Text(price, style: TextStyle(fontSize: 16, color: Colors.black)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption(BuildContext context, IconData icon, String text,
//       Color iconColor, Widget? nextPage) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.symmetric(vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         border:
//             Border.all(color: Color.fromRGBO(106, 153, 78, 1.0), width: 1.5),
//       ),
//       child: GestureDetector(
//         onTap: nextPage != null
//             ? () => Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => nextPage))
//             : null,
//         child: Row(
//           children: [
//             Icon(icon, color: iconColor),
//             SizedBox(width: 10),
//             Text(text, style: TextStyle(fontSize: 15, color: Colors.black)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOrderTotal(String label, String total) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//       margin: EdgeInsets.symmetric(vertical: 30),
//       decoration: BoxDecoration(
//         color: Color(0xFF1A4D2E),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label,
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white)),
//           Text(total,
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }

// class TabContent2 extends StatelessWidget {
//   final Map<String, int> selectedItems;

//   TabContent2({required this.selectedItems});

//   @override
//   Widget build(BuildContext context) {
//     var filteredItems =
//         selectedItems.entries.where((entry) => entry.value > 0).toList();

//     return ListView(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       children: [
//         SizedBox(height: 20), // Added space at the top
//         _buildLocationInfo(context),
//         SizedBox(height: 20), // Space between sections
//         Divider(color: Colors.grey, thickness: 1),
//         SizedBox(height: 20), // Space between sections
//         _buildOrderSummaryHeader(),
//         SizedBox(height: 10), // Space between header and content
//         _buildOrderSummary(),
//         ...filteredItems
//             .map((entry) => _buildOrderItem(
//                 entry.key, entry.value.toString(), "Rp${entry.value * 20000}"))
//             .toList(),
//         SizedBox(height: 20), // Space between items and divider
//         Divider(color: Colors.grey, thickness: 1),
//         SizedBox(height: 20), // Space between sections
//         _buildOrderItem("Delivery Fee", "", "Rp10.000"),
//         SizedBox(height: 20), // Space between sections
//         _buildSectionTitle("Payment Details"),
//         SizedBox(height: 10), // Space between title and content
//         _buildPaymentOption(context, Icons.credit_card, "Payment Methods",
//             Colors.blue, MyPayment()),
//         _buildPaymentOption(context, Icons.card_giftcard_outlined,
//             "Use Voucher", Colors.yellow, null),
//         SizedBox(height: 20), // Space before order total
//         _buildOrderTotal("   Order",
//             "Rp${filteredItems.map((e) => e.value * 20000).reduce((a, b) => a + b) + 10000}  "),
//         SizedBox(height: 20), // Space at the bottom
//       ],
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _buildLocationInfo(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.grey.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(10), // Add this line
//       ),
//       child: Row(
//         children: [
//           Image.asset('assets/location.png', width: 50, height: 50),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Alam Sutera, Jl. Jalur Sutera Bar. No.Kav.19B, RT.002/RW.003, Panunggangan Tim., Kec. Pinang, Kota Tangerang, Banten 15143",
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//                 SizedBox(height: 10),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Text("Edit",
//                       style: TextStyle(fontSize: 16, color: Colors.blue)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildOrderSummaryHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         children: [
//           Text("Order Summary",
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold)),
//           Spacer(),
//           Text("Add more",
//               style: TextStyle(
//                   fontSize: 16, color: Color.fromRGBO(106, 153, 78, 1.0))),
//         ],
//       ),
//     );
//   }

//   Widget _buildOrderSummary() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text("Krispy Kreme", style: TextStyle(fontSize: 16)),
//     );
//   }

//   Widget _buildOrderItem(String itemName, String quantity, String price) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(itemName, style: TextStyle(fontSize: 16, color: Colors.black)),
//           Row(
//             children: [
//               Text("$quantity x",
//                   style: TextStyle(fontSize: 16, color: Colors.black)),
//               SizedBox(width: 10),
//               Text(price, style: TextStyle(fontSize: 16, color: Colors.black)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption(BuildContext context, IconData icon, String text,
//       Color iconColor, Widget? nextPage) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.symmetric(vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         border:
//             Border.all(color: Color.fromRGBO(106, 153, 78, 1.0), width: 1.5),
//       ),
//       child: GestureDetector(
//         onTap: nextPage != null
//             ? () => Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => nextPage))
//             : null,
//         child: Row(
//           children: [
//             Icon(icon, color: iconColor),
//             SizedBox(width: 10),
//             Text(text, style: TextStyle(fontSize: 15, color: Colors.black)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOrderTotal(String label, String total) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//       margin: EdgeInsets.symmetric(vertical: 30),
//       decoration: BoxDecoration(
//         color: Color(0xFF1A4D2E),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label,
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white)),
//           Text(total,
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:resqus/payment_fromdeliv.dart';
import 'package:resqus/statusorder.dart';
// import 'package:resqus/mydeliv.dart';

class DeliveryPickupScreen extends StatefulWidget {
  final Map<String, int> selectedItems;

  DeliveryPickupScreen({required this.selectedItems});

  @override
  State<DeliveryPickupScreen> createState() => _DeliveryPickupScreenState();
}

class _DeliveryPickupScreenState extends State<DeliveryPickupScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
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
      body: SafeArea(
        child: Column(
          children: [
            _buildImageWithSearchBar(context),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TabContent1(selectedItems: widget.selectedItems),
                  TabContent2(selectedItems: widget.selectedItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithSearchBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Image.asset('assets/map.jpeg', fit: BoxFit.cover),
        ),
        Positioned(
          top: 20,
          left: 15,
          right: 15,
          child: Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search, size: 30, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Color.fromRGBO(106, 153, 78, 1.0),
      unselectedLabelColor: Colors.black,
      isScrollable: true,
      indicator: UnderlineTabIndicator(
        borderSide:
            BorderSide(width: 3, color: Color.fromRGBO(106, 153, 78, 1.0)),
        insets: EdgeInsets.symmetric(horizontal: 10),
      ),
      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      labelPadding: EdgeInsets.symmetric(horizontal: 37),
      tabs: [
        Tab(text: "Self Pickup"),
        Tab(text: "Delivery"),
      ],
    );
  }
}

class TabContent1 extends StatelessWidget {
  final Map<String, int> selectedItems;

  TabContent1({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    var filteredItems =
        selectedItems.entries.where((entry) => entry.value > 0).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      children: [
        SizedBox(height: 20), // Added space at the top
        _buildSectionTitle("Pickup Location"),
        SizedBox(height: 10), // Space between title and content
        _buildLocationInfo(),
        SizedBox(height: 20), // Space between sections
        _buildPickupTimeInfo(),
        Divider(color: Colors.grey, thickness: 1),
        SizedBox(height: 20), // Space between sections
        _buildOrderSummaryHeader(),
        SizedBox(height: 10), // Space between header and content
        _buildOrderSummary(),
        ...filteredItems
            .map((entry) => _buildOrderItem(
                entry.key, entry.value.toString(), "Rp${entry.value * 20000}"))
            .toList(),
        Divider(color: Colors.grey, thickness: 1),
        SizedBox(height: 20), // Space between sections
        _buildSectionTitle("Payment Details"),
        SizedBox(height: 10), // Space between title and content
        _buildPaymentOption(context, Icons.credit_card, "Payment Methods",
            Colors.blue, MyPayment()),
        _buildPaymentOption(context, Icons.card_giftcard_outlined,
            "Use Voucher", Colors.yellow, null),
        SizedBox(height: 20), // Space before order total
        _buildOrderTotal(context, "  Order",
            "Rp ${filteredItems.map((e) => e.value * 20000).reduce((a, b) => a + b)}  "),
        SizedBox(height: 20), // Space at the bottom
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset('assets/location.png', width: 50, height: 50),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "MJWV+9JG, Jl. BSD Raya Utama, Pagedangan, Kec. Pagedangan, Kabupaten Tangerang, Banten 15345",
              style: TextStyle(fontSize: 16, color: Colors.grey[850]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickupTimeInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(text: "Order can be picked up today at "),
            TextSpan(
                text: "12.00 - 20.00",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummaryHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Text("Order Summary",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Spacer(),
          Text("Add more",
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(106, 153, 78, 1.0))),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "Krispy Kreme",
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildOrderItem(String itemName, String quantity, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(itemName, style: TextStyle(fontSize: 16, color: Colors.black)),
          Row(
            children: [
              Text("$quantity x",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
              SizedBox(width: 10),
              Text(price, style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(BuildContext context, IconData icon, String text,
      Color iconColor, Widget? nextPage) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border:
            Border.all(color: Color.fromRGBO(106, 153, 78, 1.0), width: 1.5),
      ),
      child: GestureDetector(
        onTap: nextPage != null
            ? () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextPage))
            : null,
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 10),
            Text(text, style: TextStyle(fontSize: 15, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTotal(BuildContext context, String label, String total) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyDeliv()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Color(0xFF1A4D2E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            Text(total,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class TabContent2 extends StatelessWidget {
  final Map<String, int> selectedItems;

  TabContent2({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    var filteredItems =
        selectedItems.entries.where((entry) => entry.value > 0).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      children: [
        SizedBox(height: 20), // Added space at the top
        _buildLocationInfo(context),
        SizedBox(height: 20), // Space between sections
        Divider(color: Colors.grey, thickness: 1),
        SizedBox(height: 20), // Space between sections
        _buildOrderSummaryHeader(),
        SizedBox(height: 10), // Space between header and content
        _buildOrderSummary(),
        ...filteredItems
            .map((entry) => _buildOrderItem(
                entry.key, entry.value.toString(), "Rp${entry.value * 20000}"))
            .toList(),
        SizedBox(height: 20), // Space between items and divider
        Divider(color: Colors.grey, thickness: 1),
        SizedBox(height: 20), // Space between sections
        _buildOrderItem("Delivery Fee", "", "Rp10.000"),
        SizedBox(height: 20), // Space between sections
        _buildSectionTitle("Payment Details"),
        SizedBox(height: 10), // Space between title and content
        _buildPaymentOption(context, Icons.credit_card, "Payment Methods",
            Colors.blue, MyPayment()),
        _buildPaymentOption(context, Icons.card_giftcard_outlined,
            "Use Voucher", Colors.yellow, null),
        SizedBox(height: 20), // Space before order total
        _buildOrderTotal(context, "   Order",
            "Rp${filteredItems.map((e) => e.value * 20000).reduce((a, b) => a + b) + 10000}  "),
        SizedBox(height: 20), // Space at the bottom
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLocationInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10), // Add this line
      ),
      child: Row(
        children: [
          Image.asset('assets/location.png', width: 50, height: 50),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alam Sutera, Jl. Jalur Sutera Bar. No.Kav.19B, RT.002/RW.003, Panunggangan Tim., Kec. Pinang, Kota Tangerang, Banten 15143",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Edit",
                      style: TextStyle(fontSize: 16, color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Text("Order Summary",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Spacer(),
          Text("Add more",
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(106, 153, 78, 1.0))),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text("Krispy Kreme", style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildOrderItem(String itemName, String quantity, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(itemName, style: TextStyle(fontSize: 16, color: Colors.black)),
          Row(
            children: [
              Text("$quantity x",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
              SizedBox(width: 10),
              Text(price, style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(BuildContext context, IconData icon, String text,
      Color iconColor, Widget? nextPage) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border:
            Border.all(color: Color.fromRGBO(106, 153, 78, 1.0), width: 1.5),
      ),
      child: GestureDetector(
        onTap: nextPage != null
            ? () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextPage))
            : null,
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 10),
            Text(text, style: TextStyle(fontSize: 15, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTotal(BuildContext context, String label, String total) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyDeliv()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Color(0xFF1A4D2E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            Text(total,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
