import 'package:flutter/material.dart';

class NasiGorengPage extends StatefulWidget {
  @override
  _NasiGorengPageState createState() => _NasiGorengPageState();
}

class _NasiGorengPageState extends State<NasiGorengPage> {
  int selectedItemCount = 0;
  Map<String, int> itemCounts = {
    'Nasi Goreng Ayam': 4,
    'Nasi Goreng Seafood': 3,
    'Nasi Goreng Kampung': 2,
    'Nasi Goreng Spesial': 2,
  };

  Map<String, int> selectedItems = {
    'Nasi Goreng Ayam': 0,
    'Nasi Goreng Seafood': 0,
    'Nasi Goreng Kampung': 0,
    'Nasi Goreng Spesial': 0,
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
          "Nasi Goreng Karyo",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child: Image.asset(
                'assets/nasigoreng.jpg',
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
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '${itemCounts.values.reduce((a, b) => a + b)} Items Left',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      Spacer(),
                      Text(
                        '12.000',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(height: 20, thickness: 1), // Add a line divider
                  SizedBox(height: 10),
                  _buildProductListItem(
                    itemName: 'Nasi Goreng Ayam',
                    itemInfo:
                        'Delicious fried rice with chicken and special spices.',
                    itemCounter: itemCounts['Nasi Goreng Ayam'] ?? 0,
                    selectedItemCount: selectedItems['Nasi Goreng Ayam'] ?? 0,
                    onAdd: () {
                      _addItem('Nasi Goreng Ayam');
                    },
                    onRemove: () {
                      _removeItem('Nasi Goreng Ayam');
                    },
                  ),
                  _buildProductListItem(
                    itemName: 'Nasi Goreng Seafood',
                    itemInfo: 'Tasty fried rice with a mix of fresh seafood.',
                    itemCounter: itemCounts['Nasi Goreng Seafood'] ?? 0,
                    selectedItemCount:
                        selectedItems['Nasi Goreng Seafood'] ?? 0,
                    onAdd: () {
                      _addItem('Nasi Goreng Seafood');
                    },
                    onRemove: () {
                      _removeItem('Nasi Goreng Seafood');
                    },
                  ),
                  _buildProductListItem(
                    itemName: 'Nasi Goreng Kampung',
                    itemInfo:
                        'Traditional village-style fried rice with a savory flavor.',
                    itemCounter: itemCounts['Nasi Goreng Kampung'] ?? 0,
                    selectedItemCount:
                        selectedItems['Nasi Goreng Kampung'] ?? 0,
                    onAdd: () {
                      _addItem('Nasi Goreng Kampung');
                    },
                    onRemove: () {
                      _removeItem('Nasi Goreng Kampung');
                    },
                  ),
                  _buildProductListItem(
                    itemName: 'Nasi Goreng Spesial',
                    itemInfo:
                        'Special fried rice with a mix of chicken, shrimp, and vegetables.',
                    itemCounter: itemCounts['Nasi Goreng Spesial'] ?? 0,
                    selectedItemCount:
                        selectedItems['Nasi Goreng Spesial'] ?? 0,
                    onAdd: () {
                      _addItem('Nasi Goreng Spesial');
                    },
                    onRemove: () {
                      _removeItem('Nasi Goreng Spesial');
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
            SizedBox(width: 10), // Add some space between buttons
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
                padding: EdgeInsets.all(10), // Adjust the padding
                minimumSize: Size(30, 30), // Adjust the button size
              ),
            ),
            SizedBox(width: 5), // Add some space between buttons and text
            Text(
              '$selectedItemCount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5), // Add some space between text and buttons
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
                padding: EdgeInsets.all(10), // Adjust the padding
                minimumSize: Size(30, 30), // Adjust the button size
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
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
          ],
        ),
        Divider(height: 20, thickness: 0.5), // Add a line divider
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to add items to cart
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
