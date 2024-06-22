import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  bool isAllowCallsEnabled = true;
  bool isTimeSensitiveMessagesEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              leading: BackButton(),
              title: Text(
                'Notification',
                style: TextStyle(fontSize: 18),
              ),
              // centerTitle: true,
            ),
            // Divider(height: 1, color: Colors.grey),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Allow Calls',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'This will allow restaurant or drivers to call your number through this application’s call notification'),
              trailing: Switch(
                value: isAllowCallsEnabled,
                onChanged: (value) {
                  setState(() {
                    isAllowCallsEnabled = value;
                  });
                },
                activeColor: Colors.green,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Time Sensitive Messages',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'This will allow calls and chats notifications from restaurants or drivers to be prioritized being shown first'),
              trailing: Switch(
                value: isTimeSensitiveMessagesEnabled,
                onChanged: (value) {
                  setState(() {
                    isTimeSensitiveMessagesEnabled = value;
                  });
                },
                activeColor: Colors.green,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
