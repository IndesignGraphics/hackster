import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/screens/profile/land_details.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FarmDetails extends StatefulWidget {
  final farmerData;

  const FarmDetails({Key? key, this.farmerData}) : super(key: key);

  @override
  State<FarmDetails> createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  bool _isLoading = true;
  late List<dynamic> _landList;

  void loadData() async {
    setState(() {
      _landList = widget.farmerData['farmInfo'];
      _isLoading = false;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("farmDetails".tr),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _landList.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Card(
                    elevation: 10,
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${"landName".tr} : ${_landList[i]['title']}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${"surveyNo".tr} : ${_landList[i]['surveyNum']}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${"upin".tr} : ${_landList[i]['upin']}'),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                          child: Image.network(_landList[i]['shape']),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LandDetails(
                          upin: _landList[i]['upin'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
