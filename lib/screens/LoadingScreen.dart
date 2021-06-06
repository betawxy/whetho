import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whetho/services/location.dart';

import 'LocationScreen.dart';

class LoadingScreen extends StatefulWidget {
  static const route = '/loading';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    startGettingLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }

  Future<void> startGettingLocation() async {
    var loc = await Location.getCurrentLocation();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(loc: loc),
        ));
  }
}
