import 'dart:convert';

import 'weather.dart';

import 'package:http/http.dart' as http;

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?q=Mangalore&appid=cf5994d9f00b23f4ca7d7d610273a206
  //https://api.openweathermap.org/data/2.5/weather?lat=12.9716&lon=77.5946&appid=cf5994d9f00b23f4ca7d7d610273a206
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'cf5994d9f00b23f4ca7d7d610273a206';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
