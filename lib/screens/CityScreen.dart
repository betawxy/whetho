import 'package:flutter/material.dart';
import 'package:whetho/services/weather.dart';

import 'LocationScreen.dart';

class CityScreen extends StatefulWidget {
  static const route = '/city';

  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.chevron_left,
                        size: 50,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Enter city name..',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    onChanged: (v) {
                      setState(() {
                        name = v;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (name != null) {
                      var weatherData = await Weather.getWeatherOfCity(name!);
                      if (weatherData != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LocationScreen(weatherData: weatherData),
                          ),
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Get Weather',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
