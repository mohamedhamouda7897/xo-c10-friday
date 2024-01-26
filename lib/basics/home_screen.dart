import 'package:basics_c10_friday/basics/card_item.dart';
import 'package:basics_c10_friday/basics/card_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Column , Row , Stack

  List<CardModel> cards = [];

  addDumyData() {
    for (int i = 0; i < 10; i++) {
      cards.add(CardModel("assets/images/1.png", "car $i"));
    }
  }

  HomeScreen() {
    addDumyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Route"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return CardItem(cardModel: cards[index]);
        },
        itemCount: cards.length,
      ),
    );
  }

// Widget convertToCard(cardModel) {
//   return CardItem(cardModel: cardModel);
// }
}
