import 'package:basics_c10_friday/calc_btn.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Text(
                    displayResult,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                  ))),
          Expanded(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(label: "9", onClick: clickedBtn),
                  CalcBtn(label: "8", onClick: clickedBtn),
                  CalcBtn(label: "7", onClick: clickedBtn),
                  CalcBtn(label: "/", onClick: onOperatorClicked),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcBtn(label: "6", onClick: clickedBtn),
                CalcBtn(label: "5", onClick: clickedBtn),
                CalcBtn(label: "4", onClick: clickedBtn),
                CalcBtn(label: "*", onClick: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcBtn(label: "3", onClick: clickedBtn),
                CalcBtn(label: "2", onClick: clickedBtn),
                CalcBtn(label: "1", onClick: clickedBtn),
                CalcBtn(label: "-", onClick: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcBtn(
                  label: "0",
                  onClick: clickedBtn,
                ),
                CalcBtn(label: ".", onClick: clickedBtn),
                CalcBtn(label: "=", onClick: onEqualClicked),
                CalcBtn(label: "+", onClick: onOperatorClicked),
              ],
            ),
          ),
        ],
      ),
    );
  }

  clickedBtn(label) {
    if (op == '=') {
      displayResult = "";
      op = "";
      lhs = "";
    }
    displayResult += label;

    setState(() {});
  }

  onEqualClicked(equalOperation) {
    displayResult = calculate(lhs, displayResult, op);
    op = equalOperation;
    setState(() {});
  }

  String lhs = ''; //   20
  String rhs = '';
  String op = ''; //  +

  // < 25 = >

  String calculate(String lhs, String rhs, String op) {
    double LHS = double.parse(lhs);
    double RHS = double.parse(rhs);

    if (op == "+") {
      double res = LHS + RHS;
      return res.toString();
    } else if (op == "-") {
      double res = LHS - RHS;
      return res.toString();
    } else if (op == "*") {
      double res = LHS * RHS;
      return res.toString();
    } else if (op == "/") {
      double res = LHS / RHS;
      return res.toString();
    }
    return "";
  }

  onOperatorClicked(operation) {
    if (op.isEmpty) {
      lhs = displayResult;
    } else {
      lhs = calculate(lhs, displayResult, op);
    }

    op = operation;
    displayResult = "";
    print(lhs);
    setState(() {});
  }
}
