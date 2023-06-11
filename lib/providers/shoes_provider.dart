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
    Shoe(
      shoeName: "Nike Victori One",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/348937fe-e307-4523-a63b-aa7b451170f7/victori-one-mens-slides-l6rXGD.png",
      price: "24.97",
      description:
          "From the beach to the bleachers, the Nike Victori One is a must-have slide for sunny days. Lightweight and easy to wear (or pack for your vacay), it's soft, responsive foam makes lounging easy.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/348937fe-e307-4523-a63b-aa7b451170f7/victori-one-mens-slides-l6rXGD.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0abe8e81-902f-4520-8e7a-02ab354b1db7/victori-one-mens-slides-l6rXGD.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/907ea531-8fc7-459c-ac30-59a05b798883/victori-one-mens-slides-l6rXGD.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b6453c7d-e28c-4175-acea-bb85e1939a86/victori-one-mens-slides-l6rXGD.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b12c751c-a519-485d-8d7a-bda950e1a5f8/victori-one-mens-slides-l6rXGD.png",
      ],
    ),
    Shoe(
      shoeName: "Zion 2",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0b5fd6fe-7347-41a5-bab0-88c691179364/zion-2-mens-basketball-shoes-b3RVXd.png",
      price: "84.97",
      description:
          "Channel your school spirit in colors that nod to Zion Williamson's iconic college basketball season. Then, take over the game in a shoe that supports your ability to quickly change direction and avoid defenders on the court.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0b5fd6fe-7347-41a5-bab0-88c691179364/zion-2-mens-basketball-shoes-b3RVXd.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f1c135d7-d2b4-4b6b-b216-e9611795cdf1/zion-2-mens-basketball-shoes-b3RVXd.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/aef26c05-9f32-4725-845c-1532c10ad4a4/zion-2-mens-basketball-shoes-b3RVXd.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d6ed6c4e-4f36-4971-9512-56300c663b45/zion-2-mens-basketball-shoes-b3RVXd.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/35c0da2d-a12c-4864-a68a-fdb949764732/zion-2-mens-basketball-shoes-b3RVXd.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/88adfd8f-4ba6-453e-9037-555bc1e1393f/zion-2-mens-basketball-shoes-b3RVXd.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2f4d0aea-88c4-4ddf-adb0-8f6f7b212c55/zion-2-mens-basketball-shoes-b3RVXd.png",
      ],
    ),
    Shoe(
      shoeName: "Jordan Why Not .6",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0883a68c-e2d5-4771-a8bc-82ae210296c4/jordan-why-not-6-mens-shoes-T5Gl76.png",
      price: "105.97",
      description:
          "Russell Westbrook's 6th signature shoe is—you guessed it—all about speed. To get you goin' as fast as possible, we've wrapped the rubber outsole nearly up to the midsole, so you're not gonna slip when you explode from 0 to 100. Added security comes from the interior bootie that keeps you strapped in as you jet across the court. It's all held together by an outer shroud and fastened with a zippered collar that spells out Russell's signature question: 'Why Not?'",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0883a68c-e2d5-4771-a8bc-82ae210296c4/jordan-why-not-6-mens-shoes-T5Gl76.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/84ed49f4-898a-4376-a66c-ccdb2abdad73/jordan-why-not-6-mens-shoes-T5Gl76.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e692886c-0a6e-4e4e-bd6e-4befc13af909/jordan-why-not-6-mens-shoes-T5Gl76.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e57ff455-6520-4793-9a24-4d4aaadd3964/jordan-why-not-6-mens-shoes-T5Gl76.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/81716a22-0edb-4c28-92d1-11707ed8c83c/jordan-why-not-6-mens-shoes-T5Gl76.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0471b3a1-28db-4d17-8960-b1aa3ec37dfb/jordan-why-not-6-mens-shoes-T5Gl76.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/82768881-54ff-42eb-a0cc-c3db69015c5c/jordan-why-not-6-mens-shoes-T5Gl76.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/09bdc560-40b8-4259-a7cf-ec5b058299d1/jordan-why-not-6-mens-shoes-T5Gl76.png",
      ],
    ),
    Shoe(
      shoeName: "Zoom Freak 4 (Team)",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/19f77495-835b-4f3d-9fbd-c986ab774ee8/zoom-freak-4-team-basketball-shoes-p95BnP.png",
      price: "65.97",
      description:
          "Giannis is an incessant storm of stamina and skill that keeps coming at opponents for 4 quarters or more. The forward-thinking design of his latest signature shoe helps propel you down the court in a lightweight fit that moves with you. It can handle quick changes in direction on both sides of the floor, giving you side-to-side stability and multidirectional traction as you Euro step to the hoop.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/19f77495-835b-4f3d-9fbd-c986ab774ee8/zoom-freak-4-team-basketball-shoes-p95BnP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1ad25db6-3704-49fd-bb6d-39b4a00812d5/zoom-freak-4-team-basketball-shoes-p95BnP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8b97b333-d7e4-45d3-a7e4-34f871aeec93/zoom-freak-4-team-basketball-shoes-p95BnP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3cedd8c7-3a4d-48da-8cff-82a4518476dd/zoom-freak-4-team-basketball-shoes-p95BnP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6023520a-36f2-41e2-bae1-4e7b208cef72/zoom-freak-4-team-basketball-shoes-p95BnP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/393db3f9-92fc-4515-b60a-7f84b9cb469d/zoom-freak-4-team-basketball-shoes-p95BnP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0ce7d690-7f7b-440b-8850-111c8ffbe708/zoom-freak-4-team-basketball-shoes-p95BnP.png",
      ],
    ),
    Shoe(
      shoeName: "Nike ISPA Sense Flyknit",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/19b764d4-df19-45d4-8308-412255d0d488/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
      price: "200",
      description:
          "Breathe in. Breathe out. The ISPA Sense is your ticket to tranquility. Mixing sustainable materials (it's made with at least 20% recycled content by weight) with meditative comfort, the design pulls inspiration from Zen gardens. The stretchy, bootie-like upper with an airy Flyknit design integrates venting and padding for extra on-foot bliss. Tie it all together with the sleek lacing system and then stay upright with added traction on the outsole. Do good, look good, and overcome the urban environment’s most challenging obstacles with this fresh design that gives new meaning to rest and relaxation.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/19b764d4-df19-45d4-8308-412255d0d488/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/07eff064-dbe2-4a59-a91b-0945ae4733cd/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/fc536aab-e38e-47d2-accb-b334183c7c62/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8244cb29-10e8-4907-8e33-454e438b3e05/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/95575725-6f33-406f-a9c0-314d2ff2071f/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/93ff3f85-d264-4d96-a482-108e78d82947/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3fa596b4-bb28-45a0-b932-82cf13029315/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d6a77181-7439-49a9-bc0d-65fc0c1357f0/ispa-sense-flyknit-mens-shoes-dHZKmh.png",
      ],
    ),
    Shoe(
      shoeName: "Air Jordan 8 Retro",
      shoeImageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/45ce4570-dc56-4e31-aa59-650a48dd98bf/air-jordan-8-retro-big-kids-shoes-63jvjP.png",
      price: "150",
      description:
          "The kicks worn by MJ as he captured his 3rd career title are back, now in a fresh new colorway. Season-ready hues and patterns energize a classic silhouette, but don't worry—this edition of the AJ8 still has all the durable materials and Air cushioning you love.",
      gallery: [
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/45ce4570-dc56-4e31-aa59-650a48dd98bf/air-jordan-8-retro-big-kids-shoes-63jvjP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0ccbc44b-e655-4343-a86d-71fa55e91069/air-jordan-8-retro-big-kids-shoes-63jvjP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/121bc695-43b5-43a4-a4ff-4260fd096d79/air-jordan-8-retro-big-kids-shoes-63jvjP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/61f55db4-1864-4c90-90c6-6797b3a0cfd8/air-jordan-8-retro-big-kids-shoes-63jvjP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/fe6030c4-ef8d-4629-9135-1999563e6110/air-jordan-8-retro-big-kids-shoes-63jvjP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8d6ac8a5-5633-4dcc-b101-5616aeea5f85/air-jordan-8-retro-big-kids-shoes-63jvjP.png",
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/23b3a819-ca95-49b5-a93e-9ad259127d3b/air-jordan-8-retro-big-kids-shoes-63jvjP.png",
      ],
    ),
  ];

  List<Shoe> get shoes {
    return [..._shoes];
  }
}
