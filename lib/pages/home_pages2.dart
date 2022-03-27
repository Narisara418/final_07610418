import 'dart:convert';

import 'package:final07610418/models/quiz_item.dart';
import 'package:final07610418/pages/Quizdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  final int qIndex;

  const HomePage2({Key? key, required this.qIndex}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  late int _qIndex;

  @override
  @override
  void initState() {
    super.initState();
    _qIndex = widget.qIndex;
  }

  Widget build(BuildContext context) {
    var quizItem = QuizData.list[_qIndex];
    var t = quizItem.choice_list.toString();


    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // test(),
              AspectRatio(
                aspectRatio: 1.7,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.network(
                    quizItem.image_url,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              for(int i=1;i<QuizData.list.length;i++)

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '${quizItem.choice_list.toString()}',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  // test(){
  //   var list = [];
  //   list.add({
  //     'name': 'abc',
  //     'value': 111,
  //   });
  //   list.add({
  //     'name': 'xyz',
  //     'value': 222,
  //   });
  //   Map<String, dynamic> requestMap = {};
  //   requestMap['list'] = list;
  //   print(jsonEncode(requestMap));
  // }
}
