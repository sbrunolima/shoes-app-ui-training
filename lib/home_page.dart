import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/person.jpg',
            height: 50,
            width: 50,
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
