import 'package:flutter/material.dart';

class FarmDetails extends StatelessWidget {
  const FarmDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Details'),
      ),
      body: Center(
        child: Text('Farm details'),
      ),
    );
  }
}
