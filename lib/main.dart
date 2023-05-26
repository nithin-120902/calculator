import 'package:calculator/request.dart';
import 'package:calculator/response.dart';
import 'package:calculator/validate.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  Validate validate = Validate();

  String display = "";

  
  void calculate(String value) {
    setState(() {
      if(display!='Invalid Input'){
        if (display == "" && (value == "c" || value == "ce")) {
          display = "";
        } else if (value == "=") {
          Response res = validate.method1(Request(input: display));
          display=res.output;
        } else if (value == "c") {
          display = display.substring(0, display.length - 1);
        } else if (value == "ce") {
          display = "";
        } else {
          if ((value == '+' || value == '-' || value == '*' || value == '/') &&
              (display == '' ||
                  display[display.length - 1] == '+' ||
                  display[display.length - 1] == '-' ||
                  display[display.length - 1] == '*' ||
                  display[display.length - 1] == '/')) {
            display = display;
          } else {
            display = display + value;
          }
        }
      }
      else{
        if(value=='ce'||value=='c'){
          display='';
        }else{
          display=value;
        }
      }
    });
  }

  Widget generateButton(String btntxt, Color btncolor, Color txtColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          calculate(btntxt);
        },
        style: ElevatedButton.styleFrom(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          backgroundColor: btncolor,
          padding: const EdgeInsets.all(15)
        ),
        child: Text(
          btntxt,
          style: TextStyle(
            color: txtColor,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         Expanded(
           child: Container(
            alignment: Alignment.bottomRight,
             child: 
             SingleChildScrollView(
                reverse: true,
               scrollDirection: Axis.horizontal,
               child: Text(display,
                  
                  textDirection: TextDirection.ltr,
                   style: const TextStyle(color: Colors.white, fontSize: 40)
                  ),
             ),
           ),
         ),
          // const SizedBox(
          //   height:30
          // ),
           
          Row(
            children: [
              Expanded(child: generateButton('ce', Colors.grey, Colors.black)),
              Expanded(child: generateButton('/', Colors.amber[700]!, Colors.white)),
            ],
          ),
          // const SizedBox(
          //   height:2,
          // ),
          Row(
            children: [
              Expanded(child: generateButton('7', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('8', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('9', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('*', Colors.amber[700]!, Colors.white)),
            ],
          ),
          // const SizedBox(
          //   height: 2,
          // ),
          Row(
            
            children: [
              Expanded(child: generateButton('4', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('5', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('6', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('-', Colors.amber[700]!, Colors.white)),
            ],
          ),
          // const SizedBox(
          //   height: 2,
          // ),
          Row(
            
            children: [
              Expanded(child: generateButton('1', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('2', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('3', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('+', Colors.amber[700]!, Colors.white)),
            ],
          ),
          // const SizedBox(
          //   height: 2,
          // ),
          Row(
            
            children: [
              Expanded(child: generateButton('0', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('.', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('c', Colors.grey[850]!, Colors.white)),
              
              Expanded(child: generateButton('=', Colors.amber[700]!, Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
