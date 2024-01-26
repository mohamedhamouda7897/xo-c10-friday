import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  String label;

  Function onClick;

  CalcBtn({required this.label, required this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          // action
          onClick(label);
        },
        child: Text(
          "$label",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
