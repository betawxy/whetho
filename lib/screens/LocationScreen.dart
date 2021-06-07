import 'package:flutter/material.dart';
import 'package:whetho/services/weather.dart';

class LocationScreen extends StatefulWidget {
  static const route = '/location';

  const LocationScreen({Key? key, required this.weatherData}) : super(key: key);
  final Weather weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cloudy.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 45,
                    ),
                    Icon(
                      Icons.location_city,
                      size: 45,
                    ),
                  ],
                ),
                Text(
                  '${widget.weatherData.temperature} ℃  ' +
                      '${widget.weatherData.icon}',
                  style: TextStyle(
                    fontSize: 55,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '${widget.weatherData.message} in ${widget.weatherData.name}!',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'NotoSerif',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
