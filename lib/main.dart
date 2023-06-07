import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Screens
import 'screens/home_page.dart';
import './screens/start_screen.dart';

//Provider
import 'providers/shoes_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ShoeProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Shoes App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: StartScreen(),
      ),
    );
  }
}
