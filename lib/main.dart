import 'package:dashboard/my_dashboard/app_dash.dart';
import 'package:dashboard/my_dashboard/web_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2; // Default to the "Dashboard" tab.

  final List<Widget> _pages = const [
    Center(child: Text('Scanner')),
    Center(child: Text('Detailed Task')),
    Center(child: MyAppDash()),
    // Center(child: MyWebDashboard()),
    Center(child: Text('Add Task')),
    Center(child: Text('Manage Task')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800], // Customize the background color
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hii",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Tushar Kanta Swain', // Replace with the actual user name
                  style: TextStyle(
                    fontSize: 18, // Adjust the font size
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile_image.png'), // Replace with your image path
                radius: 18, // Adjust the size of the profile image
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Card(
        elevation: 8, // Add shadow to the Card
        margin: const EdgeInsets.all(0), // No margin to match the edge of the screen
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey[900], // Ensure all tabs are visible
          selectedItemColor: Colors.blue, // Customize the selected tab color
          unselectedItemColor: Colors.white, // Customize unselected tab color
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Scanner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Detailed Task',
            ),
            BottomNavigationBarItem(
               label: 'Dashboard',
              icon: Icon(Icons.dashboard),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Manage Task',
            ),
          ],
        ),
      ),
    );
  }
}
