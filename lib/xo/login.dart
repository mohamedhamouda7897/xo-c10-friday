import 'package:basics_c10_friday/slider/slider_screen.dart';
import 'package:basics_c10_friday/xo/players_model.dart';
import 'package:basics_c10_friday/xo/xo_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  String player1 = "";
  static const String routeName = "LOGIN";

  TextEditingController player2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: player2,
              decoration: InputDecoration(
                  label: Text("Player One"),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              onChanged: (val) {
                player1 = val;
                print(val);
              },
              decoration: InputDecoration(
                  label: Text("Player One"),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pushNamed(context, XoGame.routeName,
                      arguments: PlayersModel(player1, player2.text));
                },
                child: Text("Let's Go"))
          ],
        ),
      ),
    );
  }
}
