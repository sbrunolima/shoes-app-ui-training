import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';

//Screens
import '../screens/home_page.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _pageIndex = 0;

  //All screens
  final _screens = [
    MyHomePage(),
    const Scaffold(
      body: Center(
        child: Text('Categories'),
      ),
    ),
    const Scaffold(
      body: Center(child: Text('Cart')),
    ),
    const Scaffold(
      body: Center(child: Text('Favorites')),
    ),
    const Scaffold(
      body: Center(child: Text('Profile')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map((index, screen) => MapEntry(
                  index,
                  Offstage(
                    offstage: _pageIndex != index,
                    child: screen,
                  ),
                ))
            .values
            .toList(),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
          ),
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavigationBarTheme(
              data: const NavigationBarThemeData(
                elevation: 0,
                indicatorColor: Colors.transparent,
              ),
              child: NavigationBar(
                elevation: 0,
                height: 60,
                backgroundColor: Colors.white,
                selectedIndex: _pageIndex,
                onDestinationSelected: (index) => setState(() {
                  _pageIndex = index;
                }),
                destinations: [
                  NavigationDestination(
                    selectedIcon: Icon(
                      EneftyIcons.home_2_bold,
                      color: Colors.teal.shade300,
                      size: 30,
                    ),
                    icon: const Icon(
                      EneftyIcons.home_outline,
                      color: Colors.grey,
                      size: 30,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      EneftyIcons.element_3_bold,
                      color: Colors.teal.shade300,
                      size: 32,
                    ),
                    icon: const Icon(
                      EneftyIcons.element_3_outline,
                      color: Colors.grey,
                      size: 30,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      EneftyIcons.shopping_bag_bold,
                      color: Colors.teal.shade300,
                      size: 32,
                    ),
                    icon: const Icon(
                      EneftyIcons.shopping_bag_outline,
                      color: Colors.grey,
                      size: 30,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      EneftyIcons.heart_bold,
                      color: Colors.teal.shade300,
                      size: 32,
                    ),
                    icon: const Icon(
                      EneftyIcons.heart_outline,
                      color: Colors.grey,
                      size: 30,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      EneftyIcons.profile_bold,
                      color: Colors.teal.shade300,
                      size: 32,
                    ),
                    icon: const Icon(
                      EneftyIcons.profile_outline,
                      color: Colors.grey,
                      size: 30,
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
