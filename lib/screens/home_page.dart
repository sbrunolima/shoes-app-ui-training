import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Provider
import '../providers/shoes_provider.dart';

//Screens
import '../screens/description_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final shoesData = Provider.of<ShoeProvider>(context, listen: false);
    final shoes = shoesData.shoes;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: GridView.builder(
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
                      child: Image.network(
                        shoes[index].shoeImageUrl.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          '\$${shoes[index].price.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
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
    );
  }
}
