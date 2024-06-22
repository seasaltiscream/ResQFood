import 'package:flutter/material.dart';

enum MembershipLevel { Free, Basic, Premium }

class MembershipPage extends StatefulWidget {
  @override
  _MembershipPageState createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  int _selectedMembership = 0; // 0 for Free, 1 for Basic, 2 for Premium

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(),
        title: Text(
          'Membership',
          style: TextStyle(fontSize: 18),
        ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Choose your membership level:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            RadioListTile<int>(
              title: Text('Free'),
              value: 0,
              groupValue: _selectedMembership,
              onChanged: (int? value) {
                setState(() {
                  _selectedMembership = value!;
                });
              },
            ),
            RadioListTile<int>(
              title: Text('Basic (Monthly \$4.99)'),
              value: 1,
              groupValue: _selectedMembership,
              onChanged: (int? value) {
                setState(() {
                  _selectedMembership = value!;
                });
              },
            ),
            RadioListTile<int>(
              title: Text('Premium (Yearly \$39.99)'),
              value: 2,
              groupValue: _selectedMembership,
              onChanged: (int? value) {
                setState(() {
                  _selectedMembership = value!;
                });
              },
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle membership selection
                  print('Selected membership: $_selectedMembership');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A4D2E),
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                ),
                child: Text('Select Membership'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
