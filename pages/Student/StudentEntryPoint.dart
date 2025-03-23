import 'package:flutter/material.dart';
import 'package:track_n_go/pages/Student/StudentHomePage.dart';
import 'package:track_n_go/pages/map_page.dart';
import 'dart:ui'; // Import this for BackdropFilter


class StudentEntryPoint extends StatefulWidget {
  const StudentEntryPoint({super.key});

  @override
  _StudentEntryPointState createState() => _StudentEntryPointState();
}

class _StudentEntryPointState extends State<StudentEntryPoint> {
  int _selectedIndex = 0; // Track selected button index

  // Define pages once to prevent recreation
  final List<Widget> _pages = [
    StudentHomePage(),
    MapPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // Set background to white
      body: IndexedStack(
        index: _selectedIndex, // Keeps state of each page
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 50, 60, 80), // Dark blue-gray background
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(0, "assets/home.png"),
            buildNavItem(1, "assets/marker.png"),
            buildNavItem(2, "assets/user.png"),
          ],
        ),
      ),
    ),
  ),
)
    );
  }

  Widget buildNavItem(int index, String iconPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Switch index instead of navigating
        });
      },
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          _selectedIndex == index ? Colors.white : Colors.grey, // White if selected, Grey if not
          BlendMode.srcIn,
        ),
        child: Image.asset(iconPath, width: 32, height: 32),
      ),
    );
  }
}



// ProfilePage placeholder screen
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Welcome to the Profile Page!"));
  }
}
