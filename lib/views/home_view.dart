import 'package:flutter/material.dart';
import 'package:hello_flutter_app/views/tabs/tab_1_view.dart';
import 'package:hello_flutter_app/views/tabs/tab_3_view.dart';
import 'package:hello_flutter_app/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0; // Index for the currently selected tab

  // Define the tabs you want to display
  final List<Widget> _tabs = [
    Tab1View(),
    Tab3View(),
    Tab3View(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [customerSupportButton()],
        title: Text("My App"), // Add your app's title here
      ),
      drawer: CustomDrawer(),
      body: _tabs[_currentIndex], // Display the currently selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight the currently selected tab
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the selected tab when tapped
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Tab1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Tab2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Tab3",
          ),
        ],
      ),
    );
  }

  Widget customerSupportButton() {
    return IconButton(
      icon: Icon(Icons.call),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Customer Support"),
          ),
        );
      },
    );
  }
}
