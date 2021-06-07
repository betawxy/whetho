import 'dart:convert';

import 'package:http/http.dart';

import 'location.dart';

const apiKey = '440c1d7a20ae5e3446d06ee18c5eb83d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class Weather {
  final int temperature;

  Weather({required this.temperature});

  static Future<Weather?> getWeatherFromCurrentLocation() async {
    var loc = await Location.getCurrentLocation();
    var url = '$openWeatherMapURL?lat=${loc.lan}&lon=${loc.lon}' +
        '&appid=$apiKey&units=metric';
    var data = await getData(url);

    if (data != null) {
      try {
        return Weather(temperature: (data['main']['temp'] as double).toInt());
      } catch (e) {
        return null;
      }
    }

    return null;
  }
}

Future<dynamic> getData(String url) async {
  try {
    var resp = await get(Uri.parse(url));

    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    }
  } catch (e) {
    return null;
  }

  return null;
}
