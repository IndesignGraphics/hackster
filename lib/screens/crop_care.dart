import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CropCare extends StatelessWidget {
  const CropCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 135,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 110,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.healing,
                        size: 50,
                      ),
                      Text(
                        AppLocalizations.of(context)?.fertilizers ?? 'Fertilizers',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.sanitizer,
                        size: 50,
                      ),
                      Text(
                        AppLocalizations.of(context)?.pesticides ?? 'Pesticides',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.lightbulb,
                        size: 50,
                      ),
                      Text(
                        AppLocalizations.of(context)?.tips ??'Tips',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocalizations.of(context)?.healYourCrop ?? 'Heal Your Crop',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.add_a_photo,
                            size: 100,
                          ),
                          Text(AppLocalizations.of(context)?.takePicture ??'Take Picture')
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios),
                      Column(
                        children:[
                          const Icon(
                            Icons.security_update_warning,
                            size: 100,
                          ),
                          Text(AppLocalizations.of(context)?.seeDiagnosis ?? 'See Diagnosis')
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios),
                      Column(
                        children:[
                          const Icon(
                            Icons.medical_services,
                            size: 100,
                          ),
                          Text(AppLocalizations.of(context)?.getMedicine ?? 'Get Medicine')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          AppLocalizations.of(context)?.takePicture ?? 'Take a Picture',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)?.previousPicture ?? 'Previous Pictures'),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blueGrey,
                        ),
                        child: Text(AppLocalizations.of(context)?.viewAll ?? 'View All'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 125,
                    child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            height: 125,
                            width: 125,
                            child: Image.asset(
                              'assets/images/cotton.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
