import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

//Provider
import '../providers/shoes_provider.dart';

//Screens
import '../screens/description_screen.dart';

//Widgets
import 'search_bar.dart';
import 'search_bar.dart';

class ShoesCard extends StatefulWidget {
  @override
  State<ShoesCard> createState() => _ShoesCardState();
}

class _ShoesCardState extends State<ShoesCard> {
  @override
  Widget build(BuildContext context) {
    final shoesData = Provider.of<ShoeProvider>(context, listen: false);
    final shoes = shoesData.shoes;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                //Shoe Image
                SizedBox(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      //Shoe name
                      Column(
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
                          //Shoe reviews
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
                          const SizedBox(height: 20),
                          //Shoe price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: CircleAvatar(
                          backgroundColor: Colors.teal.shade300,
                          radius: 15,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
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
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 260,
      ),
    );
  }
}
