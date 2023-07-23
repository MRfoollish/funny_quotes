import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'น้ำขึ้นให้รีบตัก ผู้ชายทักให้รีบตอบ',
    'กลางคืนอย่างห้าว ตอนเช้าอย่างง่วง',
    'เคยเป็นแล้วคนดี ตอนนี้เป็นคนโสด',
    'สับรางไม่ไหว แต่สับไพ่สู้อยู่',
    'ก้าวแรกโดนใจ ก้าวต่อไปโดนเท',
  ];
  var quote = quoteList[0]; // state variable
  var repeat = 0;

  static const List<MaterialColor> colors = [ Colors.indigo , Colors.orange, Colors.green, Colors.blue, Colors.red, Colors.yellow, Colors.purple];
  var index = colors[0];

  void handleClickGo(){
    var rand = Random();
    var randomIndex = rand.nextInt(quoteList.length);
    do{
      randomIndex = rand.nextInt(quoteList.length);
    } while(repeat == randomIndex);
    MaterialColor newColor;
    do{
      var randomIndex = rand.nextInt(colors.length);
      newColor = colors[randomIndex];
    } while(newColor == index);
    setState(() {
      repeat = randomIndex;
      quote = quoteList[randomIndex];
      index = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
                quote, // positional parameter/argument
                // name parameter/argument
                style:  TextStyle(
                    color: index,
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                ),
              textAlign: TextAlign.center,
            ),
          )
      ),
    );
  }
}
