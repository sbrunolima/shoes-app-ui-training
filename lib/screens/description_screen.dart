import 'package:flutter/material.dart';

import '../objects/shoe.dart';

class DescriptionScreen extends StatefulWidget {
  final Shoe shoe;

  DescriptionScreen({required this.shoe});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
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

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.tealAccent[700],
            child: const BackButton(
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Banner
            SizedBox(
              height: 300,
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
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
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
            //Shoe name
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.shoe.shoeName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Shoe price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '\$${widget.shoe.price}',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 25),
            //Show description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.shoe.description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
