import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Provider
import '../providers/shoes_provider.dart';

//Screens
import '../screens/description_screen.dart';

//Widgets
import '../widgets/search_bar.dart';
import '../widgets/search_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _myColorTest = Colors.teal.shade300;
  @override
  Widget build(BuildContext context) {
    final shoesData = Provider.of<ShoeProvider>(context, listen: false);
    final shoes = shoesData.shoes;
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
            title: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/person.jpg',
                height: 50,
                width: 50,
              ),
            ),
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1270,c_limit/bdffd3a4-3c9b-4349-819e-ed6c7c6a7620/nike-just-do-it.jpg'),
                  ),
                ),
                //Populat title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Pupular Shoes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                //All Shoes List
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: shoes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DescriptionScreen(
                            shoe: shoes[index],
                          ),
                        ));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      shoes[index].shoeImageUrl.toString(),
                                      fit: BoxFit.cover,
                                      height: 140,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 110,
                              padding: const EdgeInsets.all(10),
                              color: Colors.white,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shoes[index].shoeName.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Text(
                                            'Reviews',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          for (int i = 0; i < 4; i++)
                                            const Icon(
                                              Icons.star_outlined,
                                              color: Colors.yellow,
                                              size: 14,
                                            ),
                                          const Icon(
                                            Icons.star_outlined,
                                            color: Colors.grey,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${shoes[index].price.toString()}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  //Add button
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _myColorTest = Colors.red;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: _myColorTest,
                                        radius: 15,
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 260,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
