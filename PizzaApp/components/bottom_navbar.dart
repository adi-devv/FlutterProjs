import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatefulWidget {
  void Function(int)? onTabChange;

  MyBottomNavbar({super.key, required this.onTabChange});

  @override
  _MyBottomNavbarState createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabChange!(index);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // Swiping in right direction
      if (_selectedIndex > 0) {
        _onTabChange(_selectedIndex - 1);
      }
    } else if (details.delta.dx < 0) {
      // Swiping in left direction
      if (_selectedIndex < 1) {
        _onTabChange(_selectedIndex + 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GNav(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          selectedIndex: _selectedIndex,
          color: Colors.grey[400],
          activeColor: Colors.black,
          tabBackgroundColor: _selectedIndex == 0
              ? Colors.deepOrangeAccent
              : Colors.grey.shade100,
          tabBorderRadius: 16,
          gap: 4 ,
          mainAxisAlignment: MainAxisAlignment.center,
          onTabChange: (index) => _onTabChange(index),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
