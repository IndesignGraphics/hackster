import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hackster/screens/agri_news.dart';
import 'package:hackster/screens/navigation/market_price.dart';
import 'package:hackster/screens/navigation/weather.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _currentPosition;
  late String subLocality, area;
  bool _isMarketLoading = true;
  bool _isWeatherLoading = true;
  bool _isLocationAvailable = false;
  late var weatherData;
  late var marketData;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) {
        return false;
      }
      _isLocationAvailable = false;
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
        _isLocationAvailable = false;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (!mounted) {
        return false;
      }
      _isLocationAvailable = false;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    _isLocationAvailable = true;
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
    setState(() {
      _isWeatherLoading = true;
    });
    await _getCurrentPosition();
    final url =
        'https://api.agromonitoring.com/agro/1.0/weather?appid=1df36a28a1544b19adeab9394f542c71&lat=${_currentPosition?.latitude}&lon=${_currentPosition?.longitude}';
    final response = await http.get(Uri.parse(url));
    final wData = jsonDecode(response.body);
    setState(() {
      weatherData = wData;
      _isWeatherLoading = false;
    });
    Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (!_isLocationAvailable) {
        setState(() {
          _loadWeatherData();
        });
      }
    });
  }

  void _loadMarketData() async {
    const url = 'https://hack-roso.onrender.com/getmarket/Rajkot';
    final response = await http.get(Uri.parse(url));
    final mData = jsonDecode(response.body);
    setState(() {
      marketData = mData;
      _isMarketLoading = false;
    });
  }

  @override
  void initState() {
    _loadMarketData();
    _loadWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isMarketLoading || _isWeatherLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height - 125,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !_isLocationAvailable
                      ? Card(
                          elevation: 3,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: const Center(
                              child: Text(
                                'Please turn on your location to see weather data!',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Weather()));
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        'Today',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            (weatherData['main']['temp'] -
                                                    273.15)
                                                .toStringAsFixed(2),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: SvgPicture.asset(
                                                'assets/svgs/umbrella.svg'),
                                          ),
                                          Text(
                                            weatherData['clouds']['all']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                              style: const TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: SvgPicture.asset(
                                                'assets/svgs/humidity.svg'),
                                          ),
                                          Text(
                                            weatherData['main']['humidity']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
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
                            child: Text(
                              "marketPrice".tr,
                              style: const TextStyle(
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
                                    SizedBox(
                                      width: 40,
                                      child: Image.network(
                                        marketData['vegtables'][0]['image'],
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor:
                                                Colors.grey.shade100,
                                            child: Container(
                                              height: 30,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      marketData['vegtables'][0]['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '₹${marketData['vegtables'][0]['maxprice']}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const Text(
                                          '+10.00%',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
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
                                    SizedBox(
                                      width: 40,
                                      child: Image.network(
                                        marketData['fruits'][0]['image'],
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Shimmer.fromColors(
                                            baseColor:
                                                Theme.of(context).primaryColor,
                                            highlightColor: Theme.of(context)
                                                .primaryColorLight,
                                            child: Container(
                                              height: 30,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      marketData['fruits'][0]['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '₹${marketData['fruits'][0]['maxprice']}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const Text(
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
                                      builder: (context) =>
                                          const MarketPrice()));
                                },
                                child: Text(
                                  "viewALlRates".tr,
                                  style: const TextStyle(
                                      color: Color(0xFF2A3832), fontSize: 15),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const MarketPrice()));
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
                  Text(
                    'Agri News',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor,
                    thickness: 3,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              AgriNews(image: 'assets/images/news1.png'),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset('assets/images/news1.png'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              AgriNews(image: 'assets/images/news2.png'),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset('assets/images/news2.png'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              AgriNews(image: 'assets/images/news3.jpg'),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset('assets/images/news3.jpg'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              AgriNews(image: 'assets/images/news4.png'),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset('assets/images/news4.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
