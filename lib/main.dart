import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Screens
import './home_page.dart';

//Provider
import './shoes_provider.dart';

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
        home: MyHomePage(),
      ),
    );
  }
}
