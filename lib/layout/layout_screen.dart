import 'package:app/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../shared/styles/colors.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.my_library_music_outlined,
            ),
            label: 'Browser'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.my_library_music_outlined,
            ),
            label: 'Browser'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.my_library_music_outlined,
            ),
            label: 'Browser'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.my_library_music_outlined,
            ),
            label: 'Browser'
          ),
        ],
      ),
      body: HomeScreen(),
    );
  }
}
