import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_desc/appDec.dart';
import 'app_desc/developers.dart';

class Profile extends StatefulWidget {
  const Profile({super.key}); // Use const for StatefulWidgets

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? userName;

  @override
  void initState() {
    _loadUserData(); // Use a private method for better organization
    super.initState();
  }

  Future<void> _loadUserData() async {
    // Moved loadUserData to a separate async method
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("userName");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView for scrollable content
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Consistent padding
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-vector/people-saving-money_24908-51569.jpg?semt=ais_hybrid'),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    userName != null ? 'Welcome, $userName' : 'Loading...',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Divider(), // Add a divider for separation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Use spaceBetween for even distribution
                children: [
                  Text("Uses and benefits of the application"),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppDesc()),
                    ),
                    child: Text("AppDesc"), // Capitalize AppDesc
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Who are the developers?"),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Developers()),
                    ),
                    child: Text("Developers"), // Capitalize Developers
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
