import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Objects
import '../objects/shoe.dart';

class BannerImage extends StatefulWidget {
  final Shoe shoe;

  BannerImage({required this.shoe});

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  String _imageToShow = '';
  var _isInit = true;

  @override
  void initState() {
    super.initState();
    if (_isInit) {
      setState(() {
        _imageToShow = widget.shoe.gallery[0].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Get the device Size
    final mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 400,
          width: mediaQuery.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                _imageToShow,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        //Gallery title
        galleryTitle(),
        //Gallery photos
        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: widget.shoe.gallery.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _imageToShow = widget.shoe.gallery[index].toString();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        widget.shoe.gallery[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget galleryTitle() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        'Gallery',
        style: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
