import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Objects
import '../objects/shoe.dart';

class NamePriceReview extends StatelessWidget {
  final Shoe shoe;

  NamePriceReview({required this.shoe});

  @override
  Widget build(BuildContext context) {
    //Const SIZEDBOX
    const sizedBox = SizedBox(height: 15);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Shoe name and Reviews
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shoeName(),
            sizedBox,
            shoePrice(),
          ],
        ),
        //Shoe price and Review
        Column(
          children: [
            reviewText(),
            sizedBox,
            reviewStars(),
          ],
        ),
      ],
    );
  }

  //Shoe Name
  Widget shoeName() {
    return SizedBox(
      width: 220,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          shoe.shoeName,
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  //Shoe Price
  Widget shoePrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        '\$${shoe.price}',
        style: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  //Shoe Review
  Widget reviewText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Reviews',
        style: GoogleFonts.openSans(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  //Shoe Stars
  Widget reviewStars() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            '(5.2)',
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
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
    );
  }
}
