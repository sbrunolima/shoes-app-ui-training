import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.search, color: Colors.grey, size: 35),
        ),
        suffixIcon: Icon(Icons.mic, color: Colors.teal.shade300, size: 30),
        hintText: 'Search',
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
