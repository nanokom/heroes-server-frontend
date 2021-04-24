import 'package:flutter/material.dart';
import 'http_service.dart';
import 'hero_model.dart' as GetHero;

class CreateHero extends StatefulWidget {
  final GetHero.Hero hero;

  CreateHero({@required this.hero});

  @override
  _CreateHeroState createState() => _CreateHeroState();
}

class _CreateHeroState extends State<CreateHero> {
  final nameOfAHero = TextEditingController();
  final powersOfAHero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes'),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child:Column(
                children: <Widget>[
                  Text("Create New Hero", style: TextStyle(height: 5, fontSize: 30)),
                  SizedBox(height: 20),
                  TextField(
                    controller: nameOfAHero,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Hero's name",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: powersOfAHero,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Hero's powers",
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Create'),
                    onPressed: () async {
                      await HttpService().createHero(nameOfAHero.text, powersOfAHero.text);
                      Navigator.of(context).pushReplacementNamed('/heroes');
                    }
                  )
                ],
            )
          ),
        ),
      ),
    );
  }
}