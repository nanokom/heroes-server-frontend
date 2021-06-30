import 'package:heroes_api/hero_detail.dart';
import 'hero_model.dart' as GetHeroes;
import 'package:flutter/material.dart';
import 'http_service.dart';
import 'create_hero.dart';

class Heroes extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heroes"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateHero()));
              })
        ],
      ),
      body: FutureBuilder(
        future: httpService.getHeroes(),
        builder: (BuildContext context,
            AsyncSnapshot<List<GetHeroes.Hero>> snapshot) {
          if (snapshot.hasData) {
            List<GetHeroes.Hero> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (GetHeroes.Hero hero) => ListTile(
                      title: Text(hero.name),
                      subtitle: Text("ID: ${hero.id}"),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HeroDetail(
                            hero: hero,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
