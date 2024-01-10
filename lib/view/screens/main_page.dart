import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/view/screens/bar_screen.dart';
import 'package:myapp/view/screens/my_page.dart';
import 'package:myapp/view/screens/search_screen.dart';
import 'package:myapp/view/screens/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List screens = [
    const MyHomePage(),
    const BarScreen(),
    const SearchScreen(),
    const MyPage()
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        elevation: 0.0,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: 'Bar'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MyAccount')
        ],
      ),
    );
  }
}
