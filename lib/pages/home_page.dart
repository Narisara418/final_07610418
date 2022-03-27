import 'package:final07610418/models/api_result.dart';
import 'package:final07610418/models/quiz_item.dart';
import 'package:final07610418/pages/Quizdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_pages2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _quizIndex;
  var _isLoading = false;
  var quizitem = QuizData.list;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  @override
  Widget build(BuildContext context) {
    // var quizItem = QuizData.list[5];
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: QuizData.list.length,
          itemBuilder: (context, index) => _buildListItem(context, index),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    var quiz = QuizData.list[index];

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      shadowColor: Colors.black.withOpacity(0.2),
      child: InkWell(
        onTap: () {
          _handleClickItem(index);

        },
        child: Row(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  quiz.image_url,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        // Text(
                        //   '${quiz.answer.toString()}',
                        //   style: TextStyle(fontSize: 15.0),
                        // ),
                        Text(
                          'QUIZ ${index+1}',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadQuiz() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
    // Future<http.Response> result = http.get(url);
    var result = await http.get(url, headers: {'id': '07610418'});
    // res = result.body;
    // print(result.body);

    var json = jsonDecode(result.body);
    var apiResult = ApiResult.fromJson(json);
    // print(apiResult.data);
    // return apiResult.data;

    setState(() {
      QuizData.list = apiResult.data
          .map<QuizItem>((item) => QuizItem.fromJson(item))
          .toList();




       print(QuizData.list);
    });


    //print('status: $status, Message: $message, Number of food: ${data.length}');

    // result.then((response) => null);
    /*result.then((response) {
    print(response.body);
  });*/
  }
  void _handleClickItem(int qIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage2(qIndex: qIndex)),
    );
  }
}
