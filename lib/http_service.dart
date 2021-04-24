import 'dart:convert';
import 'package:http/http.dart' as http;
import 'hero_model.dart';

class HttpService {
  final String url = ('https://dev.nanokom.com:8080/heroes');

  Future<List<Hero>> getHeroes() async {
    final res = await http.get(url + '/getAll'); // Response res = await get(url);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Hero> heroes = body
          .map(
            (dynamic item) => Hero.fromJson(item),
      ).toList();
      return heroes;
    } else {
      throw "Unable to get heroes.";
    }
  }

  Future<http.Response> deleteHero(int herosId) async {
    final urldel = (url + '/$herosId');
    final res = await http.delete(urldel);

    if (res.statusCode == 200) {
      return http.Response(res.body, res.statusCode);
    } else {
      throw "Unable to delete hero.";
    }
  }

  Future<http.Response> createHero(String _name, String _powers) async {
    http.Response res = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
      body: jsonEncode(<String, String>{
        'name': _name,
        'powers': _powers,
      }),
    );

    if (res.statusCode == 201) {
      return http.Response(res.body, res.statusCode);
    } else {
      throw "Unable to create hero.";
    }
  }

  Future<http.Response> updateHero(int herosId, String _name, String _powers) async {
    http.Response res = await http.put(
      url + '/$herosId',
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
      body: jsonEncode(<String, String>{
        'name': _name,
        'powers': _powers,
      }),
    );

    if (res.statusCode == 200) {
      return http.Response(res.body, res.statusCode);
    } else {
      throw "Unable to update hero.";
    }
  }
}