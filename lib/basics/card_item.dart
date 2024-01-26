import 'package:basics_c10_friday/basics/card_model.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  CardModel cardModel;

  CardItem({required this.cardModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 14,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.asset(
              cardModel.image,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              color: Color.fromRGBO(145, 51, 199, 100),
              child: Text(
                cardModel.text,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
