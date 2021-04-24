import 'package:flutter/material.dart';
import 'package:heroes_api/hero_update.dart';
import 'hero_model.dart' as GetHero;
import 'hero_update.dart';
import 'http_service.dart';

class HeroDetail extends StatelessWidget {
  final GetHero.Hero hero;
  HeroDetail({@required this.hero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Heroes'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await HttpService().deleteHero(hero.id);
                Navigator.popAndPushNamed(context,'/heroes');
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text(hero.name),
                        subtitle: Text("Name"),
                      ),
                      ListTile(
                        title: Text("${hero.id}"),
                        subtitle: Text("ID"),
                      ),
                      ListTile(
                        title: Text(hero.powers),
                        subtitle: Text("Powers"),
                      ),
                      ElevatedButton(
                          child: Text('Update'),
                        onPressed: () {
                          Navigator.push (
                              context,
                              MaterialPageRoute(builder: (context) => UpdateHero(hero)));
                        }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}