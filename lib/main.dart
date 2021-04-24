import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'heroes.dart';
import 'hero_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/heroes': (context) => Heroes(),
      },
      home: Heroes(),
    );
  }
}
