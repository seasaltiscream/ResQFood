import 'package:flutter/material.dart';
import 'cart_page.dart';

class KrispyKremePage extends StatefulWidget {
  @override
  _KrispyKremePageState createState() => _KrispyKremePageState();
}

class _KrispyKremePageState extends State<KrispyKremePage> {
  int selectedItemCount = 0;
  Map<String, int> itemCounts = {
    'Choco Glazed Donuts': 4,
    'Strawberry Glazed Donuts': 3,
    'Vanilla Glazed Donuts': 2,
    'Rocky Nuts Donuts': 2,
  };

  Map<String, int> selectedItems = {
    'Choco Glazed Donuts': 0,
    'Strawberry Glazed Donuts': 0,
    'Vanilla Glazed Donuts': 0,
    'Rocky Nuts Donuts': 0,
  };

  void _addItem(String itemName) {
    setState(() {
      if (itemCounts.containsKey(itemName) && itemCounts[itemName]! > 0) {
        selectedItemCount++;
        itemCounts[itemName] = itemCounts[itemName]! - 1;
        selectedItems[itemName] = selectedItems[itemName]! + 1;
      }
    });
  }

  void _removeItem(String itemName) {
    setState(() {
      if (selectedItems.containsKey(itemName) && selectedItems[itemName]! > 0) {
        selectedItemCount--;
        itemCounts[itemName] = itemCounts[itemName]! + 1;
        selectedItems[itemName] = selectedItems[itemName]! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Krispy Kreme",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child: Image.asset(
                'assets/krispykreme.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '12 Items Left',
                        style: TextStyle(fontSize: 16, color: Colors.red[900]),
                      ),
                      Spacer(),
                      Text(
                        '20.000',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(height: 30, thickness: 0.5),
                  SizedBox(height: 10),
                  _buildProductListItem(
                    itemName: 'Choco Glazed Donuts',
                    itemInfo:
                        'Our signature doughnut dipped in rich chocolate icing for an indulgent experience.',
                    itemCounter: itemCounts['Choco Glazed Donuts'] ?? 0,
                    selectedItemCount:
                        selectedItems['Choco Glazed Donuts'] ?? 0,
                    onAdd: () {
                      _addItem('Choco Glazed Donuts');
                    },
                    onRemove: () {
                      _removeItem('Choco Glazed Donuts');
                    },
                  ),
                  _buildProductListItem(
                    itemName: 'Strawberry Glazed Donuts',
                    itemInfo:
                        'A sweet and fruity delight of our Strawberry Glazed Doughnut. Made with a light and fluffy dough base.',
                    itemCounter: itemCounts['Strawberry Glazed Donuts'] ?? 0,
                    selectedItemCount:
                        selectedItems['Strawberry Glazed Donuts'] ?? 0,
                    onAdd: () {
                      _addItem('Strawberry Glazed Donuts');
                    },
                    onRemove: () {
                      _removeItem('Strawberry Glazed Donuts');
                    },
                  ),
                  _buildProductListItem(
                    itemName: 'Vanilla Glazed Donuts',
                    itemInfo:
                        'The perfect light and fluffy texture with a melt-in-your-mouth glaze.',
                    itemCounter: itemCounts['Vanilla Glazed Donuts'] ?? 0,
                    selectedItemCount:
                        selectedItems['Vanilla Glazed Donuts'] ?? 0,
                    onAdd: () {
                      _addItem('Vanilla Glazed Donuts');
                    },
                    onRemove: () {
                      _removeItem('Vanilla Glazed Donuts');
                    },
                  ),
                  _buildProductListItem(
                    itemName: 'Rocky Nuts Donuts',
                    itemInfo:
                        'Savor the perfect balance of sweetness and crunch with our Nutty Crunch Doughnut.',
                    itemCounter: itemCounts['Rocky Nuts Donuts'] ?? 0,
                    selectedItemCount: selectedItems['Rocky Nuts Donuts'] ?? 0,
                    onAdd: () {
                      _addItem('Rocky Nuts Donuts');
                    },
                    onRemove: () {
                      _removeItem('Rocky Nuts Donuts');
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: _buildAddToCartButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductListItem({
    required String itemName,
    required String itemInfo,
    required int itemCounter,
    required int selectedItemCount,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$itemName',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$itemInfo',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: onRemove,
              child: Text(
                '-',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A4D2E),
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                minimumSize: Size(30, 30),
              ),
            ),
            SizedBox(width: 5),
            Text(
              '$selectedItemCount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: onAdd,
              child: Text(
                '+',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A4D2E),
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                minimumSize: Size(30, 30),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$itemCounter Items Left',
              style: TextStyle(fontSize: 12, color: Colors.red[900]),
            ),
          ],
        ),
        Divider(height: 20, thickness: 0.5),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartPage(selectedItems: selectedItems),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$selectedItemCount item',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            'Add to Cart',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1A4D2E),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      ),
    );
  }
}
