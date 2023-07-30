import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'Components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                      ),
                      Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          tittle: "Ac",
                          onpress: () {
                            userInput = "";
                            answer = "";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tittle: "+/-",
                          onpress: () {
                            {
                              userInput += "+/-";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "%",
                          onpress: () {
                            {
                              userInput += "%";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "/",
                          onpress: () {
                            {
                              userInput += "/";
                              setState(() {});
                            }
                          },
                          color: Color(0xffffa00a),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          tittle: "7",
                          onpress: () {
                            userInput += "7";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tittle: "8",
                          onpress: () {
                            userInput += "8";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tittle: "0",
                          onpress: () {
                            {
                              userInput += "0";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "*",
                          onpress: () {
                            {
                              userInput += "*";
                              setState(() {});
                            }
                          },
                          color: Color(0xffffa00a),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          tittle: "4",
                          onpress: () {
                            {
                              userInput += "4";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "5",
                          onpress: () {
                            {
                              userInput += "5";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "6",
                          onpress: () {
                            {
                              userInput += "6";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "-",
                          onpress: () {
                            {
                              userInput += "-";
                              setState(() {});
                            }
                          },
                          color: Color(0xffffa00a),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          tittle: "1",
                          onpress: () {
                            {
                              userInput += "1";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "2",
                          onpress: () {
                            {
                              userInput += "2";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "3",
                          onpress: () {
                            {
                              userInput += "3";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "+",
                          onpress: () {
                            {
                              userInput += "+";
                              setState(() {});
                            }
                          },
                          color: Color(0xffffa00a),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          tittle: "0",
                          onpress: () {
                            {
                              userInput += "0";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "-",
                          onpress: () {
                            {
                              userInput += "-";
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          tittle: "Del",
                          onpress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tittle: "=",
                          onpress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
