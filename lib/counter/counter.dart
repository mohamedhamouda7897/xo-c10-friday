import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          index++;
          print(index);
          setState(() {});
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "$index",
          style: const TextStyle(fontSize: 33, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
