import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Objects
import '../objects/shoe.dart';

//Widgets
import '../widgets/my_back_icon.dart';
import '../description_screen/banner_image.dart';
import '../description_screen/name_price_review.dart';
import '../description_screen/description_text.dart';

class DescriptionScreen extends StatefulWidget {
  final Shoe shoe;

  DescriptionScreen({required this.shoe});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    //Get the device Size
    final mediaQuery = MediaQuery.of(context).size;
    //Const SIZEDBOX
    const sizedBox = SizedBox(height: 25);

    return Scaffold(
      appBar: AppBar(
        leading: MyBackIcon(),
        title: Text(
          'Details',
          style: GoogleFonts.openSans(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Banner
            BannerImage(shoe: widget.shoe),
            sizedBox,
            //Shoe NAME, PRICE, REVIEW
            NamePriceReview(shoe: widget.shoe),
            sizedBox,
            //Show description
            DescriptionText(shoe: widget.shoe),
            sizedBox,
            //Sizes and Colors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Sizes
                  shoeSizes(),
                  //Colors
                  shoesColors(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 60,
                  width: mediaQuery.width,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.teal.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Add to cart',
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget shoeSizes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        //Sizes
        Row(
          children: [
            for (int i = 4; i < 9; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(6),
                    color: i == 5 ? Colors.tealAccent[700] : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      '${i + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget shoesColors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: i == 0 ? Colors.grey : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    color: i == 0
                        ? Colors.red
                        : i == 1
                            ? Colors.green
                            : i == 2
                                ? Colors.orange
                                : i == 3
                                    ? Colors.black
                                    : Colors.blue,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
