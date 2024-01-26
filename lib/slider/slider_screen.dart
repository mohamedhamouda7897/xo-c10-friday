import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  static const String routeName="slider";
  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: const Text("Slider"),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/$index.jpg",height: 300,
          fit: BoxFit.fill,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    index--;
                    if (index == 0) {
                      index = 3;
                    }
                    setState(() {});
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    index++;
                    if (index == 4) {
                      index = 1;
                    }
                    setState(() {});
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
