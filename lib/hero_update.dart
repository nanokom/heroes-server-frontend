import 'package:flutter/material.dart';
import 'http_service.dart';
import 'hero_model.dart' as GetHero;

class UpdateHero extends StatefulWidget {
  final GetHero.Hero CurrentHero;
  const UpdateHero(this.CurrentHero);

  @override
  _UpdateHeroState createState() => _UpdateHeroState();
}

class _UpdateHeroState extends State<UpdateHero> {
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
                  Text("Update Hero", style: TextStyle(height: 5, fontSize: 30)),
                  SizedBox(height: 20),
                  TextField(
                    controller: nameOfAHero,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: powersOfAHero,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Powers",
                    ),
                  ),
                  ElevatedButton(
                      child: Text('Update'),
                      onPressed: () async {
                        await HttpService().updateHero(widget.CurrentHero.id, nameOfAHero.text, powersOfAHero.text);
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
