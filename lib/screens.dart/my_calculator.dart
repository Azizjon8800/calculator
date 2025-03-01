import 'dart:async';

import 'package:calculator_beginner2/color.dart';
import 'package:calculator_beginner2/providers/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  Map<String, bool> buttonStates = {};
  void handleTap(String text) {
    setState(() {
      buttonStates[text] = true;
    });
    Provider.of<CalculatorProvider>(context, listen: false).setValue(text);
    Timer(const Duration(milliseconds: 350), () {
      setState(() {
        buttonStates[text] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      provider.displayText,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberSymbolButton(Colors.grey[400]!, 'AC', Colors.black87),
                    numberSymbolButton(
                        Colors.grey[400]!, '+/-', Colors.black87),
                    numberSymbolButton(Colors.grey[400]!, '%', Colors.black87),
                    numberSymbolButton(symbolBgColor, '/', Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberSymbolButton(numberBgColor, '7', Colors.white),
                    numberSymbolButton(numberBgColor, '8', Colors.white),
                    numberSymbolButton(numberBgColor, '9', Colors.white),
                    numberSymbolButton(symbolBgColor, '*', Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberSymbolButton(numberBgColor, '4', Colors.white),
                    numberSymbolButton(numberBgColor, '5', Colors.white),
                    numberSymbolButton(numberBgColor, '6', Colors.white),
                    numberSymbolButton(symbolBgColor, '-', Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberSymbolButton(numberBgColor, '1', Colors.white),
                    numberSymbolButton(numberBgColor, '2', Colors.white),
                    numberSymbolButton(numberBgColor, '3', Colors.white),
                    numberSymbolButton(symbolBgColor, '+', Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: numberBgColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.fromLTRB(35, 12, 128, 12),
                      ),
                      onPressed: () => Provider.of<CalculatorProvider>(context,
                              listen: false)
                          .setValue('0'),
                      child: const Text(
                        '0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    numberSymbolButton(numberBgColor, '.', Colors.white),
                    numberSymbolButton(numberBgColor, '=', Colors.white),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget numberSymbolButton(
    Color bgColor,
    String text,
    Color textColor,
  ) {
    bool isChange = buttonStates[text] ?? false;
    return GestureDetector(
      onTap: () => handleTap(text),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChange ? Colors.white38 : bgColor,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
