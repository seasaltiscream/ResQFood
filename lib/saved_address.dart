import 'package:flutter/material.dart';

class MySavedAddresses extends StatefulWidget {
  const MySavedAddresses({super.key});

  @override
  State<MySavedAddresses> createState() => _MySavedAddresses();
}

class _MySavedAddresses extends State<MySavedAddresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Saved Addresses",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        //line under header
        children: [
          Container(
            // height: 2,
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildAddressCard(
                    'Home',
                    'Alam Sutera, Jl. Jalur Sutera Bar. No.Kav.19B, RT.002/RW.003, Panunggangan Tim., Kec. Pinang, Kota Tangerang, Banten 15143',
                    context,
                  ),
                  buildAddressCard(
                    'Apart',
                    'Alam Sutera, Jl. Jalur Sutera Bar. No.Kav.19B, RT.002/RW.003, Panunggangan Tim., Kec. Pinang, Kota Tangerang, Banten 15143',
                    context,
                  ),
                  //Spacer(),
                  SizedBox(
                    height: 40,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      // Add your add new address action here
                    },
                    icon: Icon(Icons.add_circle_outline,
                        color: Colors.black), // Set icon color to black
                    label:
                        Text('Add new', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildAddressCard(String label, String address, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.transparent, // Set card color to transparent
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.black, width: 0.5), // Add border side
        ),
        elevation: 0, // Set elevation to 0 to remove shadow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                address,
                style: TextStyle(fontSize: 14),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add your edit detail action here
                  },
                  child: Text(
                    'edit detail',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
