import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LandDetails extends StatefulWidget {
  final String upin;

  const LandDetails({Key? key, required this.upin}) : super(key: key);

  @override
  State<LandDetails> createState() => _LandDetailsState();
}

class _LandDetailsState extends State<LandDetails> {
  bool _isLoading = true;
  late var landData;

  void loadLandData() async {
    final url = 'https://hack-roso.onrender.com/getland/${widget.upin}';
    final response = await http.get(Uri.parse(url));
    final lData = jsonDecode(response.body);
    setState(() {
      landData = lData;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    loadLandData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(landData['landTitle']),
            ),
            body: Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height - 110,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Land Title : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['landTitle'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Survey Number : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['newSurveyNumber'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'UPIN : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['UPIN'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Village : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['village'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Taluko : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['taluka'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'District : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['district'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Old Survey No. : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['oldSurveyNumber'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Total Area : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['totalArea'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Total Assesment Rs. : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['totalAssesment'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Land Use : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['landUse'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Tenure : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            landData['tenure'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Image.network(landData['shape'],fit: BoxFit.fill,),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
