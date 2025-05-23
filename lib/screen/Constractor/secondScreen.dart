import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  final String name;
  const Secondscreen({super.key, required this.name});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondScreen')),
      body: Column(children: [Text(widget.name)]),
    );
  }
}
