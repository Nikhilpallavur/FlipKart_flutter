import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../../style/color.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Calculator> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';

  onButtonClick(value) {
    var finalInput = input + value;
    var operationArr = ['%', '/', 'x', '-', '+', '.'];
    var operationPrefixArr = ['%', '/', 'x', '+'];

    if (value == 'AC') {
      setState(() {
        input = '';
        output = '';
      });
      return;
    }
    if (operationPrefixArr.contains(finalInput)) {
      setState(() {
        input = '';
        output = '';
      });
      return;
    }

    if (finalInput == '.') {
      setState(() {
        input = '0$finalInput';
        output = '';
      });
      return;
    }
    if (finalInput == '=') {
      setState(() {
        input = '';
        output = '';
      });
      return;
    }
    if (input.isNotEmpty) {
      var lastValue = input.substring(input.length - 1);
      if (value == '⌫') {
        setState(() {
          input = input.substring(0, input.length - 1);
        });
        return;
      }
      if (input.contains('.') && value == '.') {
        setState(() {
          input = input;
          output = '';
        });
        return;
      }

      if (operationArr.contains(value) && operationArr.contains(lastValue)) {
        setState(() {
          input = input;
          output = '';
        });
        return;
      }
      if (operationArr.contains(lastValue) && value == '=') {
        setState(() {
          input = input;
          output = '';
        });
        return;
      }
      if (['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
          .contains(finalInput)) {
        setState(() {
          input = finalInput;
          output = '';
        });
        return;
      }

      if (finalInput == '%' ||
          finalInput == '%' ||
          finalInput == '/' ||
          finalInput == 'x' ||
          finalInput == '-' ||
          finalInput == '+') {
        setState(() {
          input = output + finalInput;
          output = '';
        });
        return;
      }
      if (value == '=') {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression exp = p.parse(userInput);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        setState(() {
          output = eval.toString();
        });
        return;
      }
    }
    setState(() {
      input = finalInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: Container(
          color: appBg,
          alignment: Alignment.bottomRight,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(input, style: TextStyle(color: inputColor, fontSize: 30)),
                Text(output,
                    style: TextStyle(color: outputColor, fontSize: 45)),
              ]),
        )),
        Container(
            color: appBg,
            child: Column(children: [
              Row(
                children: [
                  button(text: 'AC', textColor: buttonColor),
                  button(text: '⌫', textColor: buttonColor),
                  button(text: '%', textColor: buttonColor),
                  button(text: '/', textColor: buttonColor),
                ],
              ),
              Row(
                children: [
                  button(text: '7', textColor: buttonNumber),
                  button(text: '8', textColor: buttonNumber),
                  button(text: '9', textColor: buttonNumber),
                  button(text: 'x', textColor: buttonColor),
                ],
              ),
              Row(
                children: [
                  button(text: '4', textColor: buttonNumber),
                  button(text: '5', textColor: buttonNumber),
                  button(text: '6', textColor: buttonNumber),
                  button(text: '-', textColor: buttonColor),
                ],
              ),
              Row(
                children: [
                  button(text: '1', textColor: buttonNumber),
                  button(text: '2', textColor: buttonNumber),
                  button(text: '3', textColor: buttonNumber),
                  button(text: '+', textColor: buttonColor),
                ],
              ),
              Row(
                children: [
                  button(text: '0', textColor: buttonNumber),
                  button(text: '.', textColor: buttonNumber),
                  button(
                      text: '=', textColor: buttonNumber, bgColor: buttonColor),
                ],
              ),
            ]))
      ]),
    );
  }

  Widget button({text = '', textColor = Colors.white, bgColor = Colors.black}) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(text == '=' ? 100 : 5)),
            padding: const EdgeInsets.all(20),
            backgroundColor: bgColor),
        onPressed: () => onButtonClick(text),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
