import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  String text;
  ResultPage({super.key, required this.text});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Text(
        widget.text,
        style: const TextStyle(color: Colors.black),
      )),
    );
  }
}
