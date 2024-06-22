import 'package:flutter/material.dart';
import 'package:resqus/deliverypickup.dart';

class CartPage extends StatelessWidget {
  final Map<String, int> selectedItems;

  CartPage({required this.selectedItems});

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
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Text('Cart', style: TextStyle(color: Colors.black)),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0, // Remove default shadow
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: selectedItems.entries
                  .where((entry) => entry.value > 0)
                  .length,
              itemBuilder: (context, index) {
                var entry = selectedItems.entries
                    .where((entry) => entry.value > 0)
                    .toList()[index];
                return CartItem(
                  itemName: entry.key,
                  itemCount: entry.value,
                  itemPrice: 20000, // Adjust the price as needed
                );
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: Colors.grey[300],
                indent: 16,
                endIndent: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DeliveryPickupScreen(selectedItems: selectedItems),
                  ),
                );
                // Handle checkout or any further action
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Rp ${selectedItems.values.reduce((a, b) => a + b) * 20000}', // Calculate total
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A4D2E),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String itemName;
  final int itemCount;
  final int itemPrice;

  CartItem({
    required this.itemName,
    required this.itemCount,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                'Rp $itemPrice',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Spacer(),
          Spacer(),
          Spacer(),
          Text(
            'x$itemCount',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Text(
            'Rp ${itemCount * itemPrice}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
