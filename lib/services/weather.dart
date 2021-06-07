import 'dart:convert';

import 'package:http/http.dart';

import 'location.dart';

const apiKey = '440c1d7a20ae5e3446d06ee18c5eb83d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class Weather {
  final int temperature;
  final String name;
  final String icon;
  final String message;

  Weather({
    required this.temperature,
    required this.name,
    required this.icon,
    required this.message,
  });

  static Future<Weather?> getWeatherFromCurrentLocation() async {
    var loc = await Location.getCurrentLocation();
    var url = '$openWeatherMapURL?lat=${loc.lan}&lon=${loc.lon}' +
        '&appid=$apiKey&units=metric';
    var data = await getData(url);

    return _extractData(data);
  }

  static Weather? _extractData(data) {
    if (data != null) {
      try {
        print(data);
        var temp = (data['main']['temp'] as double).toInt();
        return Weather(
          temperature: temp,
          name: data['name'],
          icon: getWeatherIcon(data['weather'][0]['id']),
          message: getMessage(temp),
        );
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  static Future<Weather?> getWeatherOfCity(String name) async {
    var url = '$openWeatherMapURL?q=$name&appid=$apiKey&units=metric';
    var data = await getData(url);
    return _extractData(data);
  }
}

String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '🌩';
  } else if (condition < 400) {
    return '🌧';
  } else if (condition < 600) {
    return '☔️';
  } else if (condition < 700) {
    return '☃️';
  } else if (condition < 800) {
    return '🌫';
  } else if (condition == 800) {
    return '☀️';
  } else if (condition <= 804) {
    return '☁️';
  } else {
    return '🤷‍';
  }
}

String getMessage(int temp) {
  if (temp > 25) {
    return 'It\'s 🍦 time';
  } else if (temp > 20) {
    return 'Time for shorts and 👕';
  } else if (temp < 10) {
    return 'You\'ll need 🧣 and 🧤';
  } else {
    return 'Bring a 🧥 just in case';
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
