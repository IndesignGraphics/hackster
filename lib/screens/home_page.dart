import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackster/screens/navigation/market_price.dart';
import 'package:hackster/screens/navigation/weather.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _currentPosition;
  late String subLocality, area;
  bool _isLoading = true;
  late var weatherData;

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
    final wData = jsonDecode(response.body);
    setState(() {
      weatherData = wData;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _loadWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height - 160,
              child: Column(
                children: [
                  SizedBox(
                    height: 75,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return Container(
                            width: 75,
                            height: 75,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.add),
                            ),
                          );
                        }
                        return Container(
                          width: 75,
                          height: 75,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/cotton.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Weather()));
                    },
                    child: Card(
                      elevation: 5,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF2A3832),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              subLocality,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 28),
                            ),
                            Text(
                              area,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 28),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Today',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      (weatherData['main']['temp']-273.15).toStringAsFixed(2),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.cloud,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: SvgPicture.asset(
                                          'assets/svgs/umbrella.svg'),
                                    ),
                                    Text(
                                      weatherData['clouds']['all'].toString(),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: SizedBox(
                                        height: 43,
                                        child: Center(
                                          child: SvgPicture.asset(
                                              'assets/svgs/wind.svg'),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${weatherData['wind']['speed']} m/s',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: SvgPicture.asset(
                                          'assets/svgs/humidity.svg'),
                                    ),
                                    Text(
                                      weatherData['main']['humidity'].toString(),
                                      style:const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 3,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F7F5),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: const Color(0xFF2A3832),
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Market Price',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              elevation: 1,
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/pea.png'),
                                    const Text(
                                      'Pea',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        'assets/svgs/positive_graph.svg'),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Text(
                                          '₹58.23',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          '+10.00%',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 13),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              elevation: 1,
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/chilli.png'),
                                    const Text(
                                      'Chilli',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        'assets/svgs/negative_graph.svg'),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Text(
                                          '₹36.83',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          '-7.36%',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 13),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MarketPrice()));
                                },
                                child: const Text(
                                  'View All Rates',
                                  style: TextStyle(
                                      color: Color(0xFF2A3832), fontSize: 15),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MarketPrice()));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF2A3832),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Card(),
                ],
              ),
            ),
          );
  }
}
