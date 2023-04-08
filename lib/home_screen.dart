import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/round-button.dart';
import 'constant/constant.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                          child: Text(userInput.toString(),style: TextStyle(fontSize: 30,color: Colors.white),)),
                      const SizedBox(height: 15.0,),
                      Text(answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        RoundButton(title: 'AC',onPressed: (){
                          userInput = '';
                          answer = '';
                          setState(() {

                          });
                        },),
                        RoundButton(title: 'DEL',onPressed: (){
                          userInput = userInput.substring(0, userInput.length - 1);
                          setState(() {

                          });
                        }),
                        RoundButton(title: '%',onPressed: (){
                          userInput += '%';
                          setState(() {

                          });
                        }),
                        RoundButton(title: '/',color: Colors.orange,onPressed: (){
                          userInput += '/';
                          setState(() {

                          });
                        }),
                      ]
                    ),
                    Row(
                        children: [
                          RoundButton(title: '7',onPressed: (){
                            // userInput = '${userInput}7';
                            //we can use the iteration or the down one
                            userInput += '7';
                            setState(() {

                            });
                          },),
                          RoundButton(title: '8',onPressed: (){
                            userInput += '8';
                            setState(() {

                            });
                          }),
                          RoundButton(title: '9',onPressed: (){
                            userInput += '9';
                            setState(() {

                            });
                          }),
                          RoundButton(title: 'x',color: Colors.orange,onPressed: (){
                            userInput += 'x';
                            setState(() {

                            });
                          }),
                        ]
                    ),
                    Row(
                        children: [
                          RoundButton(title: '4',onPressed: (){
                            userInput += '4';
                            setState(() {

                            });
                          },),
                          RoundButton(title: '5',onPressed: (){
                            userInput += '5';
                            setState(() {

                            });
                          }),
                          RoundButton(title: '6',onPressed: (){
                            userInput += '6';
                            setState(() {

                            });
                          }),
                          RoundButton(title: '-',color: Colors.orange,onPressed: (){
                            userInput += '-';
                            setState(() {

                            });
                          }),
                        ]
                    ),
                    Row(
                        children: [
                          RoundButton(title: '1',onPressed: (){
                            userInput += '1';
                            setState(() {

                            });
                          },),
                          RoundButton(title: '2',onPressed: (){
                            userInput += '2';
                            setState(() {

                            });
                          }),
                          RoundButton(title: '3',onPressed: (){
                            userInput += '3';
                            setState(() {

                            });
                          }),
                          RoundButton(title: '+',color: Colors.orange,onPressed: (){
                            userInput += '+';
                            setState(() {

                            });
                          }),
                        ]
                    ),
                    Row(
                        children: [
                          RoundButton(title: '00',onPressed: (){
                            userInput += '00';
                            setState(() {

                            });
                          },),
                          RoundButton(title: '0',onPressed: (){
                            userInput += '0';
                            setState(() {

                            });
                          }),
                          RoundButton(title: '.',onPressed: (){
                            userInput += '.';
                            setState(() {

                            });
                          }),
                          RoundButton(title: '=',color: Colors.orange,onPressed: (){
                            equalPres();
                            setState(() {

                            });
                          }),
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void equalPres(){

    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

