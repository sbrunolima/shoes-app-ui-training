import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Shoe
import './shoe.dart';

class ShoeProvider with ChangeNotifier {
  List<Shoe> _shoes = [
    Shoe(
      shoeName: "Nike Air Max 270",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0dcadeab-93ef-4eac-8a99-e99c2105bd93/air-max-270-big-kids-shoes-HbtNX3.png",
      price: "130",
    ),
    Shoe(
      shoeName: "Nike Air Force 1 '07 Premium",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/626c036d-a863-4db9-bba8-801f99a59b7b/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
      price: "98.97",
    ),
    Shoe(
      shoeName: "Nike Juniper Trail 2",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/4abc2470-c465-4d87-ab0f-7f7e97b9c21c/juniper-trail-2-mens-trail-running-shoes-lFQ3lS.png",
      price: "85",
    ),
    Shoe(
      shoeName: "Nike Dunk High",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/ff2483c8-4507-4a9a-9a46-9765e4298099/dunk-high-womens-shoes-PXHcGT.png",
      price: "125",
    ),
    Shoe(
      shoeName: "KD Trey 5 X",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/e9f7de09-c91c-4050-a32f-55fb407968a4/kd-trey-5-x-basketball-shoes-cNfPMN.png",
      price: "65.97",
    ),
    Shoe(
      shoeName: "Converse Chuck Taylor All Star High Top",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/cbcgizb3kwn863tkpoyy/converse-chuck-taylor-all-star-high-top-2c-10c-infant-toddler-shoe-N123eN.png",
      price: "35",
    ),
    Shoe(
      shoeName: "Nike Air Force 1 '07",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/80ee2dd8-a2e5-444e-b036-0622b15cae76/air-force-1-07-mens-shoes-rXkGJX.png",
      price: "92.97",
    ),
    Shoe(
      shoeName: "Nike Oneonta Be True",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/fd403e2c-a9ea-429e-9126-510b655efbfa/oneonta-be-true-sandals-rhGlMt.png",
      price: "49.97",
    ),
  ];

  List<Shoe> get shoes {
    return [..._shoes];
  }
}
