import 'package:flutter/foundation.dart';

class Hero {
  final int id;
  final String name;
  final String powers;

  Hero({
    @required this.id,
    @required this.name,
    @required this.powers
  });

  factory Hero.fromJson(Map<String, dynamic> json) { //<String, dynamic>
    return Hero(
      id: json['id'] as int,
      name: json['name'] as String,
      powers: json['powers'] as String,
    );
  }
}

