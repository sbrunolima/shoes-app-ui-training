import 'package:flutter/material.dart';

class Advertising extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
            'https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1270,c_limit/bdffd3a4-3c9b-4349-819e-ed6c7c6a7620/nike-just-do-it.jpg'),
      ),
    );
  }
}
