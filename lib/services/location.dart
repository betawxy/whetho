import 'package:geolocator/geolocator.dart';

class Location {
  final double lon;
  final double lan;

  Location({required this.lon, required this.lan});

  @override
  String toString() {
    return 'Location(lon:$lon, lan:$lan)';
  }

  static Future<Location> getCurrentLocation() async {
    var loc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    return Location(lon: loc.longitude, lan: loc.latitude);
  }
}
