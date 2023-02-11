import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LiveStock extends StatelessWidget {
  const LiveStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String?> listOfLiveStock = [
      "cattleAndBuffaloDevelopment".tr,
      "fodderDevelopment".tr,
      "poultryDevelopment".tr,
      "dairyDevelopment".tr,
      "veterinaryServiceAndAnimalHealth".tr,
      "sheepGoatAndWoolDevelopment".tr,
      "otherLiveStockDevelopment".tr,
      "horseAndCamelDevelopment".tr,
      "sheepDevelopmentBranch".tr,
      "livestockHealth".tr
    ];

    List<String> listOfLinks = [
      'https://doah.gujarat.gov.in/cattle-buffalo-development.htm',
      'https://doah.gujarat.gov.in/fodder-development.htm',
      'https://doah.gujarat.gov.in/poultry-development.htm',
      'https://doah.gujarat.gov.in/veterinary-services-animal.htm',
      'https://doah.gujarat.gov.in/veterinary-services-animal.htm',
      'https://doah.gujarat.gov.in/sheep-goat-wool-development.htm',
      'https://doah.gujarat.gov.in/other-livestock-development.htm',
      'https://doah.gujarat.gov.in/horse-camel-development.htm',
      'https://doah.gujarat.gov.in/sheep-development-branch.htm',
      'https://doah.gujarat.gov.in/livestock-health.htm'
    ];

    _launchURL(int i) async {
      print('call for i: $i');
      var url = listOfLinks[i];
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("liveStock".tr),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/livestock.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 270,
                child: ListView.separated(
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor),
                            child: Text(
                              listOfLiveStock[i]!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          _launchURL(i);
                        },
                      );
                    },
                    separatorBuilder: (context, i) {
                      return const SizedBox(
                        height: 0,
                      );
                    },
                    itemCount: listOfLiveStock.length),
              ),
            )
          ],
        ));
  }
}
