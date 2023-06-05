import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Shoe
import '../objects/shoe.dart';

class ShoeProvider with ChangeNotifier {
  List<Shoe> _shoes = [
    Shoe(
      shoeName: "Nike Dunk Low",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/062fc556-4491-4cee-bb81-9b570869f8ac/dunk-low-big-kids-shoes-pfrWfJ.png",
      price: "90.00",
      description:
          "The Nike Dunk Low is an easy score for your closet. This mid-‘80s hoops icon returns with super-durable construction and original colors. With ankle padding and rubber traction, this one is a slam dunk.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/914cc95d-9fa0-4b15-89c2-8df03fc721c3/dunk-low-big-kids-shoes-pfrWfJ.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3cb336e1-7411-42ea-96ed-4fd4bf0f25bd/dunk-low-big-kids-shoes-pfrWfJ.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b33d11b2-d593-4ce0-a297-3304270c46a0/dunk-low-big-kids-shoes-pfrWfJ.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3622ad06-45e5-4d4b-9bcc-30f9cdfc05a4/dunk-low-big-kids-shoes-pfrWfJ.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7b4c9739-1099-4fc1-8a35-62ecb2602351/dunk-low-big-kids-shoes-pfrWfJ.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1c0a11e6-ab4e-4f11-be5f-f5dec537954a/dunk-low-big-kids-shoes-pfrWfJ.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/264e1a42-c4de-4b60-91c5-955605e275b1/dunk-low-big-kids-shoes-pfrWfJ.png",
      ],
    ),
    Shoe(
      shoeName: "Nike Huarache Run",
      shoeImageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/sug1ysccbxkcypnw3lvx/huarache-run-big-kids-shoes-2KTrWZKn.png",
      price: "90.00",
      description:
          "The Nike Huarache Run is unmistakable. It’s all about the famous Huarache heel strap—grab it and slide your foot right in. A snug bootie design helps keep everything secure and supported while you run, climb and play.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/eeb8dcb2-2a33-4c7f-8159-400dd45e82a0/huarache-run-big-kids-shoes-2KTrWZKn.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/117cbecf-9e4a-44b7-8899-cd35999ff481/huarache-run-big-kids-shoes-2KTrWZKn.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/89992640-161d-4079-82d7-d82b55635bc8/huarache-run-big-kids-shoes-2KTrWZKn.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a02f3735-fcf3-472d-abb0-a741c088dea8/huarache-run-big-kids-shoes-2KTrWZKn.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a7b9e45f-5a42-4252-a922-3e9528b77b6d/huarache-run-big-kids-shoes-2KTrWZKn.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5e0e0f4d-9c95-4ee0-94c8-e57b7b9ec1db/huarache-run-big-kids-shoes-2KTrWZKn.png",
      ],
    ),
    Shoe(
      shoeName: "Nike Air Force 1 Mid By You",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1e80f517-1d6f-47c7-9a1a-7f476cbea04d/custom-nike-air-force-1-mid-by-you-shoes.png",
      price: "140.00",
      description:
          "Let your design shine in satin, keep it classic in canvas, or get luxe with leather. No matter what you choose, these AF1s are all about you. 12 color choices and an additional gum option for the sole mean your design is destined to be one of a kind, just like you.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1e80f517-1d6f-47c7-9a1a-7f476cbea04d/custom-nike-air-force-1-mid-by-you-shoes.png",
        "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/fa0c3668-6f3b-49a4-b885-e184ac42bdfd/custom-nike-air-force-1-mid-by-you-shoes.png",
        "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5b305545-951b-4ba5-b0ad-7da44f5b2de3/custom-nike-air-force-1-mid-by-you-shoes.png",
        "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/9ac3fc93-d17a-463f-bf71-0e0a21c9db19/custom-nike-air-force-1-mid-by-you-shoes.png",
        "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b6babda8-1326-4f95-9560-1eb257bf0bf7/custom-nike-air-force-1-mid-by-you-shoes.png",
      ],
    ),
    Shoe(
      shoeName: "Nike Air Force 1 '07 Premium",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9cb28256-2287-4d0f-9d0e-4920d39b2bee/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
      price: "98.97",
      description:
          "A mix of real and synthetic leather, satin overlays and premium embroidery come together in this anniversary edition of the Nike Air Force 1 ’07 Premium to celebrate the people and culture of New York City’s Ghanaian community. While embroidered backtabs honor Little Accra, a heavily Ghanaian enclave in the Bronx, graphics on the insoles and metallic dubraes with adinkra symbols encourage sharing stories and building community.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9cb28256-2287-4d0f-9d0e-4920d39b2bee/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/11ed8c40-1769-41a3-94f2-893463c9c59d/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3b6c75b9-be5b-4957-bb7b-8e4fff55f0b4/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0a893def-7532-4caa-8a53-98cd92a55462/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8832e960-e676-48b8-9dcb-98e596929542/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8dfc34b8-86df-409e-bd8c-bac4a89991b9/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/17bd5cff-c786-4532-9c5e-401ff9923864/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/025cceab-701b-4129-a4bb-c7ca9f085e7d/air-force-1-07-premium-womens-shoes-6xVZ4x.png",
      ],
    ),
  ];

  List<Shoe> get shoes {
    return [..._shoes];
  }
}
