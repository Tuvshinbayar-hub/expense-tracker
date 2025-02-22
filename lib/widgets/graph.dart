import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() {
    return _Graph();
  }
}

class _Graph extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Text('Graph'),
    );
  }
}
