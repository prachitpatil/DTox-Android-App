import 'dart:convert';

import 'package:dtox/services/quiz_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  QuizGenerator quizGenerator;
  List<Results> results;

  //get http => http;

  Future<void> fetchQuestions()async{
    var res = await get("https://opentdb.com/api.php?amount=10&category=18");
    var decRes = jsonDecode(res.body);
    //print(decRes);
    quizGenerator = QuizGenerator.fromJson(decRes);
    results = quizGenerator.results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz',
        style: TextStyle(
          letterSpacing: 2.0,
          color: Colors.blueGrey[700],
        ),
        ),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.grey[300],
      ),
      body: RefreshIndicator(
        onRefresh: fetchQuestions,
        child: FutureBuilder(
          future: fetchQuestions(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.none:
              return Text("Press button to start");
              case ConnectionState.active:
              case ConnectionState.waiting:
              return Center(
              child: CircularProgressIndicator(),
              );
              case ConnectionState.done:
              if(snapshot.hasError) return Container();
              return questionList();
              }
                return null;
            },
    ),
      ),
    );

}

ListView questionList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index)=> Card(
        color: Colors.white,
        elevation: 0.0,
        child: ExpansionTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                results[index].question,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FilterChip(
                      backgroundColor: Colors.grey[100],
                      label: Text(results[index].category),
                      onSelected: (b) {},
                    ),
                    FilterChip(
                      backgroundColor: Colors.grey[100],
                      label: Text(results[index].difficulty),
                      onSelected: (b) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Text(results[index].type.startsWith('m') ? 'M' : 'B'),
          ),
          children: results[index].allAnswers.map((m) {
            return AnswerWidget(results, index, m);
        }).toList(),

        ),
      ),
    );
  }
}

class AnswerWidget extends StatefulWidget {

  final List<Results> results;
  final int index;
  final String m;

  AnswerWidget(this.results,this.index,this.m);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {

  Color c = Colors.black;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.m == widget.results[widget.index].correctAnswer) {
            c = Colors.green;
          }
          else{
            c = Colors.red;
          }
        });
      },
      title: Text(
        widget.m,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: c,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
