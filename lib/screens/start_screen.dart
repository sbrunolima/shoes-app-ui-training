import 'package:flutter/material.dart';

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
    Scaffold(
      body: Text('Categories'),
    ),
    Scaffold(
      body: Text('Wallet'),
    ),
    Scaffold(
      body: Text('Favorites'),
    ),
    Scaffold(
      body: Text('Profile'),
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
                height: 50,
                backgroundColor: Colors.white,
                selectedIndex: _pageIndex,
                onDestinationSelected: (index) => setState(() {
                  _pageIndex = index;
                }),
                destinations: [
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home_filled,
                      color: Colors.tealAccent[700],
                    ),
                    icon: const Icon(
                      Icons.home_filled,
                      color: Colors.black,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.menu_open_rounded,
                      color: Colors.tealAccent[700],
                    ),
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.shopping_bag,
                      color: Colors.tealAccent[700],
                    ),
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.favorite,
                      color: Colors.tealAccent[700],
                    ),
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.person_outline,
                      color: Colors.tealAccent[700],
                    ),
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
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
