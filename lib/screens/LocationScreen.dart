import 'package:flutter/material.dart';

import '../services/location.dart';

class LocationScreen extends StatefulWidget {
  static const route = '/location';

  const LocationScreen({Key? key, required this.loc}) : super(key: key);
  final Location loc;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on),
                Icon(Icons.location_city),
              ],
            ),
            Text('9^ C'),
            Text(
              'You\'ll need a and b in c!',
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
