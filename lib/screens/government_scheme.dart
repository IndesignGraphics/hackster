import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GovernmentScheme extends StatelessWidget {
  const GovernmentScheme({Key? key}) : super(key: key);

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
      'title': 'કિસાન પરીવાહન યોજના',
      'description':
          'કૃષિ ઉત્પાદનના પરિવહન માટે રાજ્યના ખેડૂતો સામાન્ય રીતે ટ્રેક્ટરનો ઉપયોગ કરતાં હોય છે તેમજ ઓછી જણસ હોય તે સંજોગોમાં ભાડુતી અન્ય ગુડ્ઝ કેરેઝ વાહન દ્વારા કૃષિ ઉત્પાદન ખેત બજારો કે અન્ય બજારમાં પહોંચાડતા હોય છે. ઘણી વખત પરિવહન માટે વાહન ઉપલબ્ધ ન હોય ત્યરે ખેડૂતોને મુશ્કેલીનો સામનો કરવો પડે છે. આમ, કૃષિ ઉત્પાદન પરિવહન સરળ બનાવવાના અને રાજ્યના ખેડૂતો ગુડ્ઝ કેરેજ વાહન વસાવી શકે તે હેતુથી સને ૨૦૨૦-૨૧થી રાજ્યના ખેડૂતોને મીડીયમ સાઇઝના ગુડ્ઝ કેરેઝ વાહનની ખરીદી ઉપર નાણાંકીય સહાય આપવાની યોજના શરૂ કરેલ છે. ૧૦૦% રાજ્ય પુરસ્કૃત યોજના છે.',
      'link': 'https://agri.gujarat.gov.in/kisan-parivahan-yojna.htm'
    },
    {
      'title': 'મુખ્ય મંત્રી પાક સંગ્રાહ માળખું યોજના',
      'description':
          'રાજ્યના દરેક વર્ગના ખેડૂતોને કૃષિ પેદાશોના સારા ઉત્પાદન મળવા છતાં કમોસમી વરસાદ, વાવાઝોડું, અતિવૃષ્ટી તેમજ અન્ય પરિબળોથી ઉત્પાદનની ગુણવત્તા પર માઠી અસર થાય છે તેમજ લાંબા સમય સુધી પાક સંગ્રહ માટેની જોઇ યોગ્ય વ્યવસ્થા ન હોવાના લીધે પાકનો બગાડ થાય છે. પાક ઉત્પાદન બચાવવા માટે રાજ્યના ખેડૂતોને ખેત પેદાશોના સંગ્રહની સગવડ મળી રહે તો પાક ઉત્પાદનને લાંબા સમય સુધી સુરક્ષિત રાખી શકાય છે અને ખેડૂતોને સુરક્ષિત પાક સંગ્રહ ગોડાઉન ઉપલબ્ધ થવાથી ખેત પેદાશોની ગુણવત્તા જળવાઇ રહે અને યોગ્ય સમયે વેચાણ કરી શકશે, જેથી ખેડૂતોને આર્થિક ફાયદો થાય અને જેના પરિણામે ખેતી વધુ નકાકારક બની શકે છે. તે હેતુથી રાજ્યના ખેડોતોને પાક સંગ્રહ સ્ટ્રક્ચર બનાવવા માટે સહાય આપવાની યોજના સને ૨૦૨૦-૨૧થી શરૂ કરવામાં આવેલ છે.૧૦૦% રાજ્ય પુરસ્કૃત યોજના છે.',
      'link': 'https://agri.gujarat.gov.in/CM-Pak-sangrah-structure-yojna.htm'
    },
    {
      'title': 'પીએમ કિસાન',
      'description':
          'ભારત સરકારશ્રી દ્વારા ખેડૂતોની આવક વધારવાના ભાગરૂપે ખેતી કરતા ખેડૂત કુટુંબને સહાયરૂપ થવા માટે ૧૦૦% કેન્દ્ર સહાયિત યોજના તરીકે પ્રધાનમંત્રી કિસાન સન્માન નિધિ યોજના જાહેર કરવામાં આવેલ છે.',
      'link': 'https://agri.gujarat.gov.in/pm-kisan.htm'
    },
    {
      'title': 'AGR-2 યોજના',
      'description':
          'રાજ્યમાં ઔદ્યોગિકીકરણ અને શહેરીકરણને કારણે ખેતમજૂરોની ઘણી અછત છે. ઓછા ખર્ચે અને વધુ ખેત ઉત્પાદન સાથે કૃષિ ઉદ્યોગોને સફળ બનાવવા માટે કૃષિ યાંત્રિકરણનો વિસ્તાર કરવો અનિવાર્ય છે. કૃષિ યાંત્રિકરણને કારણે જમીન, પાણી અને વાતાવરણ જેવા કુદરતી, બિનઅસરકારક સ્ત્રોતોનો મહત્તમ ઉપયોગ કરીને અને ઓછા ખર્ચે ખેડૂત સારી ગુણવત્તા અને વધુ ખેત ઉત્પાદન મેળવી શકે છે. આમ, કૃષિ યાંત્રીકરણ વધારવા માટે, AGR 2 (કૃષિ મશીનરી) યોજના હેઠળ સહાય આપવામાં આવે છે, રાજ્યના 208 તાલુકાઓમાં જ્યાં કેન્દ્ર દ્વારા પ્રાયોજિત "કૃષિ યાંત્રીકરણ પર સબમિશન" યોજના અમલમાં નથી.',
      'link': 'https://agri.gujarat.gov.in/agr2-scheme.htm'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
    height: MediaQuery.of(context).size.height - 140,
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
