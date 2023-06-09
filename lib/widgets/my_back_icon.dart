import 'package:flutter/material.dart';

class MyBackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: CircleAvatar(
          backgroundColor: Colors.teal.shade300,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
