import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgriBusiness extends StatelessWidget {
  const AgriBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.agriBusiness ??'AgriBusiness'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height-100,
        padding:const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Agribusiness Linkages of Farmer',
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
              SizedBox(height: 10,),
              Text('Amiha Agro',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text('Revakhand Udhyog',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text(' Agro',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text(
                'Cooperative Membership',
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
              SizedBox(height: 10,),
              Text('KRIBHCO Cooperative and Beyond',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text('Copper Cooperative suger limited',style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      )
    );
  }
}
