// import 'package:flutter/material.dart';
// import 'package:resqus/krispykremepage.dart';

// class ViewAllPage extends StatefulWidget {
//   @override
//   _ViewAllPageState createState() => _ViewAllPageState();
// }

// class _ViewAllPageState extends State<ViewAllPage> {
//   bool _isSearching = false;
//   TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 1,
//                   blurRadius: 10,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: AppBar(
//               backgroundColor: Colors.white,
//               title: !_isSearching
//                   ? Text(
//                       "Stores near you",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     )
//                   : TextField(
//                       controller: _searchController,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         hintText: "Search...",
//                         hintStyle: TextStyle(color: Colors.grey),
//                         border: InputBorder.none,
//                       ),
//                     ),
//               actions: [
//                 IconButton(
//                   icon: Icon(
//                     _isSearching ? Icons.close : Icons.search,
//                     color: Colors.black,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _isSearching = !_isSearching;
//                       if (!_isSearching) {
//                         _searchController.clear();
//                       }
//                     });
//                   },
//                 ),
//               ],
//               elevation: 0, // Remove default shadow
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
//                 child: Column(
//                   children: [
//                     buildItem(
//                       context,
//                       'assets/krispykreme.jpg',
//                       'Krispy Kreme',
//                       '3 donuts left',
//                       '20.000',
//                       () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => KrispyKremePage(),
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     buildItem(
//                       context,
//                       'assets/nasigoreng.jpg', // Adjust the asset path
//                       'Nasi Goreng Karyo',
//                       '5 item left',
//                       '30.000',
//                       () {
//                         //NAVIGATE
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     buildItem(
//                       context,
//                       'assets/dunkin.jpg', // Adjust the asset path
//                       'J.Co',
//                       '2 donuts left',
//                       '25.000',
//                       () {
//                         //NAVIGATE
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildItem(BuildContext context, String imagePath, String title,
//       String subtitle, String price, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 1,
//               blurRadius: 8,
//               offset: Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Item Picture
//             Container(
//               width: double.infinity,
//               height: 80,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(30),
//                 ),
//                 image: DecorationImage(
//                   image: AssetImage(imagePath),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Item Details
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 0),
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Price
//             Container(
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.all(10),
//               child: Text(
//                 price,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:resqus/krispykremepage.dart';

class ViewAllPage extends StatefulWidget {
  @override
  _ViewAllPageState createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.white,
              title: !_isSearching
                  ? Text(
                      "Stores near you",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )
                  : TextField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
              actions: [
                IconButton(
                  icon: Icon(
                    _isSearching ? Icons.close : Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                      if (!_isSearching) {
                        _searchController.clear();
                      }
                    });
                  },
                ),
              ],
              elevation: 0, // Remove default shadow
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  children: [
                    buildItem(
                      context,
                      'assets/krispykreme.jpg',
                      'Krispy Kreme',
                      '3 donuts left',
                      '20.000',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KrispyKremePage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    buildItem(
                      context,
                      'assets/nasigoreng.jpg',
                      'Nasi Goreng Karyo',
                      '5 items left',
                      '30.000',
                      () {
                        //NAVIGATE
                      },
                    ),
                    SizedBox(height: 20),
                    buildItem(
                      context,
                      'assets/dunkin.jpg',
                      'J.Co',
                      '2 donuts left',
                      '25.000',
                      () {
                        //NAVIGATE
                      },
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

  Widget buildItem(BuildContext context, String imagePath, String title,
      String subtitle, String price, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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
            // Item Picture
            Container(
              width: double.infinity,
              height: 90,
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
            // Item Details
            Padding(
              padding: EdgeInsets.all(8),
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
                  SizedBox(height: 5),
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
                  fontSize: 14,
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
}
