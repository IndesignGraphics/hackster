import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Insurance extends StatelessWidget {
  const Insurance({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

   static const _listOfObjects = [
    {
      'title': 'ખાતેદાર ખેડૂત અસ્ક્માત વીમા યોજના',
      'description':
          'ગુજરાત સરકારે રાજ્યના ખાતેદાર ખેડૂતોને આકસ્મીક મૃત્યુ /કાયમી અંપગતાના કિસ્સામાં વીમા રક્ષણ આપવાની યોજના ૨૬ મી જાન્યુઆરી, ૧૯૯૬ ના શુભ દિવસથી આરંભ કરેલ છે. આ યોજના ૧૦૦% રાજ્ય સરકાર પુરુસ્કૃત યોજના છે. આ યોજનામાં રાજ્યના તમામ ખાતેદાર ખેડૂતો વતી રાજ્ય સરકારશ્રી દ્વારા વીમા પ્રિમીયમની ચુકવણી કરવામાં આવે છે. આ યોજના ગુજરાત સામુહિક જૂથ જનતા અકસ્માત વીમા યોજના હેઠળ તા.૦૧/૦૪/૨૦૦૮ થી વિમા નિયામકશ્રી, ગાંધીનગર મારફત અમલમાં છે.',
      'link': 'https://agri.gujarat.gov.in/farmers-accidental-insurance-scheme.htm'
    },
    {
      'title': 'પ્રધાન મંત્રી પાક વીમા યોજના',
      'description':
          'રાજયમાં પ્રઘાન મંત્રી ફસલ બીમા યોજના વર્ષ ૨૦૧૬-૧૭ ની ખરીફ,૨૦૧૬ ઋતુથી ભારત સરકારશ્રીની ગાઇડલાઇન મુજબ અમલી કરવામાં આવેલ છે.પ્રઘાન મંત્રી ફસલ બીમા યોજનામાં નીચે મુજબના ખરીફ ઋતુના કુલ ૧૬ અને રવિ/ઉનાળુ ઋતુના કુલ ૧૨ પાકો મળી કુલ ૨૮ પાકોને આવરી લેવામાં આવેલ છે.',
      'link': 'https://pmfby.gov.in'
    },
    {
      'title': 'બાયો-ફ્યુઅલ ટ્રી પ્લાન્ટ વીમો',
      'description':
          'વિશ્વની લગભગ 80% ઊર્જા જરૂરિયાતો અશ્મિભૂત ઇંધણ દ્વારા પૂરી થાય છે જે માંગમાં વધારાને કારણે દિવસેને દિવસે ઘટી રહી છે. આનાથી અમને વૈકલ્પિક ઉર્જા સ્ત્રોતોની શોધ કરવામાં આવી છે, જેમાં સૌથી વધુ આશાસ્પદ બાયો-ઇંધણ છે. આ પર્યાવરણને અનુકૂળ ઈંધણને પ્રોત્સાહન આપવા માટે, સરકાર બાયો-ઈંધણના વૃક્ષ/છોડ ઉગાડનારાઓને ઊર્જા સુરક્ષા પ્રાપ્ત કરવા માટે વિવિધ પ્રોત્સાહનો, વિમો અને સબસિડી આપી રહી છે.',
      'link': 'https://agritech.tnau.ac.in/crop_insurance/crop_insurance_scheme_biofuel.html'
    },
    {
      'title': 'રાષ્ટ્રીય કૃષિ વીમા યોજના',
      'description':
          '1. કુદરતી આફતો, જીવાતોના પરિણામે કોઈપણ સૂચિત પાક નિષ્ફળ જવાની સ્થિતિમાં ખેડૂતોને વીમા કવરેજ અને નાણાકીય સહાય પૂરી પાડવી\n2. કૃષિમાં પ્રગતિશીલ ખેતી પદ્ધતિઓ, ઉચ્ચ મૂલ્યના ઇનપુટ્સ અને ઉચ્ચ ટેકનોલોજી અપનાવવા ખેડૂતોને પ્રોત્સાહિત કરવા.\n3. ખેતીની આવકને સ્થિર કરવામાં મદદ કરવા માટે, ખાસ કરીને આપત્તિના વર્ષોમાં',
      'link': 'https://www.aicofindia.com/AICGujarati/Pages/National-Agriculture-Insurance-Scheme-(NAIS).aspx'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
    height: MediaQuery.of(context).size.height - 130,
    padding: EdgeInsets.all(10),
    child: ListView.separated(
        itemBuilder: (ctx, i) {
          return Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    _listOfObjects[i]['title']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    _listOfObjects[i]['description']!,
                    style: TextStyle(),
                  ),
                  TextButton(
                    onPressed: () {
                      _launchURL(
                        _listOfObjects[i]['link']!,
                      );
                    },
                    child: Text(
                      'View More',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (ctx, i) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: _listOfObjects.length),
      ),
    );
  }
}
