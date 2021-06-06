import 'package:flutter/material.dart';

import '../services/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, required this.loc}) : super(key: key);
  final Location loc;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.loc.toString()),
    );
  }
}
