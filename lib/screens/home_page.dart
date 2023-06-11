import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Provider
import '../providers/shoes_provider.dart';

//Widgets
import '../home_screen/search_bar.dart';
import '../home_screen/advertising.dart';
import '../home_screen/shoes_card.dart';
import '../home_screen/profile_data.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            collapsedHeight: 140,
            floating: true,
            pinned: true,
            backgroundColor: Colors.grey.shade200,
            title: ProfileData(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SearchBar(),
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                //Advertising
                Advertising(),
                //Popular title
                popularTitle(),
                //All Shoes List
                ShoesCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget popularTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        'Pupular Shoes',
        style: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
