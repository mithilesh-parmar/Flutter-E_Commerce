import 'package:flutter/material.dart';

class Product {
  String name;
  String price;
  String imageUrl;
  String avgRating;
  String peopleRated;
  String id;
  String summary;
  String description;

  Product(
      {this.name,
      this.price,
      this.imageUrl,
      this.avgRating,
      this.peopleRated,
      this.description,
      this.summary,
      @required this.id});
}

var productList = [
  Product(
    id: "1",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9379567/2019/4/22/d46be9a1-5cfb-47ae-873b-5ce1c05c785e1555920915378-Lacoste-pink-6941555920914148-1.jpg',
    price: '2800',
    avgRating: '4',
    name: 'Lacoste',
    summary: 'Men Pink Regular Fit Solid Casual Shirt',
    description:
        'Pink solid casual shirt, has a button-down collar, short sleeves, straight hem, one patch pocket',
    peopleRated: '34',
  ),
  Product(
    id: "2",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
    price: '2100',
    avgRating: '3',
    name: 'U.S. Polo Assn.',
    summary: 'Men Blue & Grey Tailored Fit Checked Linen Casual Shirt',
    description:
        'Blue and grey checked linen casual shirt, has a button-down collar, long sleeves, button placket, curved hem, one patch pocket',
    peopleRated: '24',
  ),
  Product(
    id: "3",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9458589/2019/5/13/59718066-a332-4dab-ba3b-eabf12b545431557738274369-US-Polo-Assn-Denim-Co-Men-Navy-Blue--White-Slim-Fit-Checked--1.jpg',
    price: '1959',
    avgRating: '3.9',
    name: 'GAP',
    summary: 'Men White Solid Linen Slim Fit Casual Shirt',
    description:
        'White solid linen casual shirt, has mandarin collar, long sleeves, button placket, curved hem curved hem, one patch pocket',
    peopleRated: '224',
  ),
  Product(
    id: "4",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8395521/2019/5/13/8f522db5-5e94-45c4-8467-46682a2e1b201557738269886-US-Polo-Assn-Denim-Co-Men-White--Black-Slim-Fit-Self-Design--1.jpg',
    price: '909',
    avgRating: '4.9',
    name: 'Blackberry\'s',
    summary: 'Men Blue Smart Fit Solid Casual Shirt',
    description:
        'Blue solid casual shirt, has a spread collar, long sleeves, curved hem, one patch pocket, button closure curved hem curved hem, one patch pocket',
    peopleRated: '224',
  ),
];

var mayLikeProductList = [
  Product(
    id: "q",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9379567/2019/4/22/d46be9a1-5cfb-47ae-873b-5ce1c05c785e1555920915378-Lacoste-pink-6941555920914148-1.jpg',
    price: '2800',
    avgRating: '4',
    name: 'Lacoste',
    summary: 'Men Pink Regular Fit Solid Casual Shirt',
    description:
        'Pink solid casual shirt, has a button-down collar, short sleeves, straight hem, one patch pocket',
    peopleRated: '34',
  ),
  Product(
    id: "w",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
    price: '2100',
    avgRating: '3',
    name: 'U.S. Polo Assn.',
    summary: 'Men Blue & Grey Tailored Fit Checked Linen Casual Shirt',
    description:
        'Blue and grey checked linen casual shirt, has a button-down collar, long sleeves, button placket, curved hem, one patch pocket',
    peopleRated: '24',
  ),
  Product(
    id: "e",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9458589/2019/5/13/59718066-a332-4dab-ba3b-eabf12b545431557738274369-US-Polo-Assn-Denim-Co-Men-Navy-Blue--White-Slim-Fit-Checked--1.jpg',
    price: '1959',
    avgRating: '3.9',
    name: 'GAP',
    summary: 'Men White Solid Linen Slim Fit Casual Shirt',
    description:
        'White solid linen casual shirt, has mandarin collar, long sleeves, button placket, curved hem curved hem, one patch pocket',
    peopleRated: '224',
  ),
  Product(
    id: "r",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8395521/2019/5/13/8f522db5-5e94-45c4-8467-46682a2e1b201557738269886-US-Polo-Assn-Denim-Co-Men-White--Black-Slim-Fit-Self-Design--1.jpg',
    price: '909',
    avgRating: '4.9',
    name: 'Blackberry\'s',
    summary: 'Men Blue Smart Fit Solid Casual Shirt',
    description:
        'Blue solid casual shirt, has a spread collar, long sleeves, curved hem, one patch pocket, button closure curved hem curved hem, one patch pocket',
    peopleRated: '224',
  ),
  Product(
    id: "q1",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9379567/2019/4/22/d46be9a1-5cfb-47ae-873b-5ce1c05c785e1555920915378-Lacoste-pink-6941555920914148-1.jpg',
    price: '2800',
    avgRating: '4',
    name: 'Lacoste',
    summary: 'Men Pink Regular Fit Solid Casual Shirt',
    description:
        'Pink solid casual shirt, has a button-down collar, short sleeves, straight hem, one patch pocket',
    peopleRated: '34',
  ),
  Product(
    id: "w1",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8029543/2018/12/10/b68dd23e-b5c5-472a-b980-31c8bbeb52cd1544448690625-Blackberrys-Men-Shirts-5571544448689522-1.jpg',
    price: '2100',
    avgRating: '3',
    name: 'U.S. Polo Assn.',
    summary: 'Men Blue & Grey Tailored Fit Checked Linen Casual Shirt',
    description:
        'Blue and grey checked linen casual shirt, has a button-down collar, long sleeves, button placket, curved hem, one patch pocket',
    peopleRated: '24',
  ),
  Product(
    id: "e1",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9458589/2019/5/13/59718066-a332-4dab-ba3b-eabf12b545431557738274369-US-Polo-Assn-Denim-Co-Men-Navy-Blue--White-Slim-Fit-Checked--1.jpg',
    price: '1959',
    avgRating: '3.9',
    name: 'GAP',
    summary: 'Men White Solid Linen Slim Fit Casual Shirt',
    description:
        'White solid linen casual shirt, has mandarin collar, long sleeves, button placket, curved hem curved hem, one patch pocket',
    peopleRated: '224',
  ),
  Product(
    id: "r1",
    imageUrl:
        'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8395521/2019/5/13/8f522db5-5e94-45c4-8467-46682a2e1b201557738269886-US-Polo-Assn-Denim-Co-Men-White--Black-Slim-Fit-Self-Design--1.jpg',
    price: '909',
    avgRating: '4.9',
    name: 'Blackberry\'s',
    summary: 'Men Blue Smart Fit Solid Casual Shirt',
    description:
        'Blue solid casual shirt, has a spread collar, long sleeves, curved hem, one patch pocket, button closure curved hem curved hem, one patch pocket',
    peopleRated: '224',
  ),
];
