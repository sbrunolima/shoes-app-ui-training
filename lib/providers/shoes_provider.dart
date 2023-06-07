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
    Shoe(
      shoeName: "Nike Air Max Alpha Trainer 5",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a162ca4b-a442-4182-bfa0-4be07063e623/air-max-alpha-trainer-5-mens-training-shoes-7LjRM6.png",
      price: "69.97",
      description:
          "Finish your last rep with power and rack it with a roar that stuns the gym floor in the Nike Air Max Alpha Trainer 5. Max Air cushioning offers comfortable stability for lifting whether it’s a light or heavy day. A wide, flat base gives you enhanced stability and grip for all kinds of tough workouts without sacrificing style, as you roam from station to station and set to set.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a162ca4b-a442-4182-bfa0-4be07063e623/air-max-alpha-trainer-5-mens-training-shoes-7LjRM6.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/34ebe4ea-4b82-4f82-b5c9-69419afd7d3a/air-max-alpha-trainer-5-mens-training-shoes-7LjRM6.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/fe82d02d-dbc3-42ea-ae65-3fc9f50163b7/air-max-alpha-trainer-5-mens-training-shoes-7LjRM6.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6a413290-8268-43e5-83eb-2785151fcc48/air-max-alpha-trainer-5-mens-training-shoes-7LjRM6.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9d749695-466b-4f1f-94f7-d84869d1f269/air-max-alpha-trainer-5-mens-training-shoes-7LjRM6.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1d80e10e-0018-4918-80a8-4f8aaad12c38/air-max-alpha-trainer-5-mens-training-shoes-7LjRM6.png",
      ],
    ),
    Shoe(
      shoeName: "Nike Team Hustle D 9",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/cfrpsse6aflyw4nocpts/team-hustle-d-9-little-kids-shoes-w2vpMS.png",
      price: "55.00",
      description:
          "The Nike Team Hustle D 9 captures style from the basketball court in a durable design. Lightweight fabric around the forefoot is breathable, and leather around the sides creates structure. Soft foam cushions little feet for comfort that lasts all day.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/cfrpsse6aflyw4nocpts/team-hustle-d-9-little-kids-shoes-w2vpMS.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/xrl1zgnrif99wdt1esww/team-hustle-d-9-little-kids-shoes-w2vpMS.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/djclstdsvol9gk2ixqec/team-hustle-d-9-little-kids-shoes-w2vpMS.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dwxnrhvgicz4yiiaysie/team-hustle-d-9-little-kids-shoes-w2vpMS.png",
      ],
    ),
    Shoe(
      shoeName: "KD Trey 5 X",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dd7243b8-2a71-46d9-af95-594e2cd628c9/kd-trey-5-x-basketball-shoes-cNfPMN.png",
      price: "65.97",
      description:
          "With its lightweight upper and plush support system, the KD Trey 5 X can help you float like KD, waiting for the perfect moment to drive to the hoop. A secure midfoot strap is suited for scoring binges and defensive stands, so that you can lock in and keep winning.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dd7243b8-2a71-46d9-af95-594e2cd628c9/kd-trey-5-x-basketball-shoes-cNfPMN.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7d099722-61a3-4d18-8487-b1a47ba1fb05/kd-trey-5-x-basketball-shoes-cNfPMN.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/55c2aaed-2b23-42de-aa66-f42839ae77b0/kd-trey-5-x-basketball-shoes-cNfPMN.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/21f809a2-653a-4c0b-af8b-72c1dff0b223/kd-trey-5-x-basketball-shoes-cNfPMN.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b3c249ff-7927-45d0-9ec0-8b585d247a17/kd-trey-5-x-basketball-shoes-cNfPMN.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/df6537cd-06df-496a-8644-81fdab31f05a/kd-trey-5-x-basketball-shoes-cNfPMN.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1656e4ef-01de-4fca-a9c3-501d8c15850a/kd-trey-5-x-basketball-shoes-cNfPMN.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/65127a0f-1c8f-4208-9188-c8058e0af735/kd-trey-5-x-basketball-shoes-cNfPMN.png",
      ],
    ),
    Shoe(
      shoeName: "Nike Oneonta Be True",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/85f2c89b-6407-40ce-b66c-e8634adfba96/oneonta-be-true-sandals-rhGlMt.png",
      price: "49.97",
      description:
          "Reinvent what it means to be you. Celebrating the LGBTQIA+ community, these lightweight, durable sandals are ready for your next adventure. Gradient branding and colorful straps pair with paint-speckled, rugged tread and plush cushioning so you can go from streets to trails without pause.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/85f2c89b-6407-40ce-b66c-e8634adfba96/oneonta-be-true-sandals-rhGlMt.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9d7d466c-1998-47d4-ae0c-d69edf4ec4cc/oneonta-be-true-sandals-rhGlMt.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b73c5ffa-9b8a-4fca-a003-ceeaf401eb54/oneonta-be-true-sandals-rhGlMt.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/fb2d5d27-f77d-41ce-a1fd-4f915c646285/oneonta-be-true-sandals-rhGlMt.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/03a2329f-a52d-42e7-8317-bdc63cbc7515/oneonta-be-true-sandals-rhGlMt.png",
      ],
    ),
    Shoe(
      shoeName: "Nike Dunk High Up",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3813de29-f135-47ca-b577-f09525a77ef4/dunk-high-up-womens-shoes-3DnDtC.png",
      price: "91.97",
      description:
          "There’s never a wrong time to stand tall. Created for the hardwood but taken to the streets, the Nike Dunk High Up gives the '80s b-ball icon the perfect lift. With its classic high-top design, sport-like essence, and elevated midsole, it stays true to hoops DNA while letting you channel your confidence with every step.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3813de29-f135-47ca-b577-f09525a77ef4/dunk-high-up-womens-shoes-3DnDtC.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/13da66ef-e1e8-42b0-89d3-f4bc2796f4ff/dunk-high-up-womens-shoes-3DnDtC.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/cc841175-74e8-4710-9cab-db095cdf0f59/dunk-high-up-womens-shoes-3DnDtC.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9ae061f8-a6e3-430b-ab7d-ea0c72b54f8c/dunk-high-up-womens-shoes-3DnDtC.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f9e4512b-e629-402b-bacf-30251f962e19/dunk-high-up-womens-shoes-3DnDtC.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/917a3f77-eec9-4bef-bed6-56446dcbf04b/dunk-high-up-womens-shoes-3DnDtC.png",
      ],
    ),
    Shoe(
      shoeName: "Nike Air Force 1 LV8",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0dd1eda5-b9f0-4d23-8e6e-8c3520567bb2/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
      price: "79.97",
      description:
          "Meet the sneaker that leaves us with heart-eyes. Candy-inspired details make for a sweet take on the legendary AF1. Shiny patent leather adds a glossy finish (just like candy apples) while Swoosh logos full of 3-D hearts give these kicks a look you'll love. So go ahead, treat yourself!",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0dd1eda5-b9f0-4d23-8e6e-8c3520567bb2/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b89f0b64-d567-48f0-b49a-c09ec44e86ea/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c75a7e0b-76f2-416e-9eac-37ab11b826f1/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/74b8d6cd-4ed0-4d03-9cb7-c5c045cc1ae0/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e5d360c3-107c-45ba-8e27-19f93d61180e/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e5d360c3-107c-45ba-8e27-19f93d61180e/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/908cfedb-774b-430b-add2-24ba68794cff/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/27017eea-55f7-4cf2-8907-7de51fafb4c8/air-force-1-lv8-big-kids-shoes-5D3Vm7.png",
      ],
    ),
  ];

  List<Shoe> get shoes {
    return [..._shoes];
  }
}
