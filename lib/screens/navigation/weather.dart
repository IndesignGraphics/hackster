import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Position? _currentPosition;
  late String subLocality, area;
  bool _isLoading = true;
  late var weatherData;
  late var forecastData;

  var date = DateFormat('EEE, MMM d').format(DateTime.now());

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) {
        return false;
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (!mounted) {
          return false;
        }
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (!mounted) {
        return false;
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        subLocality = place.subLocality!;
        area = place.subAdministrativeArea!;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
    _getAddressFromLatLng(_currentPosition!);
  }

  void _loadWeatherData() async {
    await _getCurrentPosition();
    final url =
        'https://api.agromonitoring.com/agro/1.0/weather?appid=1df36a28a1544b19adeab9394f542c71&lat=${_currentPosition?.latitude}&lon=${_currentPosition?.longitude}';
    final response = await http.get(Uri.parse(url));
    final forecasturl =
        'https://api.agromonitoring.com/agro/1.0/weather/forecast?appid=1df36a28a1544b19adeab9394f542c71&lat=${_currentPosition?.latitude}&lon=${_currentPosition?.longitude}';
    final forecastresponse = await http.get(Uri.parse(forecasturl));
    final wData = jsonDecode(response.body);
    final fData = jsonDecode(forecastresponse.body);
    setState(() {
      weatherData = wData;
      forecastData = fData;
      
      _isLoading = false;
    });
  }

  String _getFormattedDate(int i){
    var date2 = DateTime.fromMillisecondsSinceEpoch(forecastData[i]['dt']*1000);
    var format = DateFormat('HH:mm');
  
    return format.format(date2);
  }

  @override
  void initState() {
    _loadWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${subLocality},',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              area,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              date,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/sun.svg',width: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          (weatherData['main']['temp'] - 273.15)
                              .toStringAsFixed(2),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          weatherData['weather'][0]['main'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Card(
                color: Colors.grey,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SvgPicture.asset('assets/svgs/umbrella.svg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'RainFall',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        weatherData['clouds']['all'].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Card(
                color: Colors.grey,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: 43,
                          child: Center(
                            child: SvgPicture.asset('assets/svgs/wind.svg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Wind',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        '${weatherData['wind']['speed']} m/s',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Card(
                color: Colors.grey,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SvgPicture.asset('assets/svgs/humidity.svg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Humidity',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        weatherData['main']['humidity'].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 102,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: ((context, i) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 11),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        Text(
                          _getFormattedDate(i),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        SvgPicture.asset('assets/svgs/sun.svg'),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          (forecastData[i]['main']['temp'] - 273.15)
                              .toStringAsFixed(0)+'°C',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
