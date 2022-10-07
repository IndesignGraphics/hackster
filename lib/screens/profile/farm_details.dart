import 'package:flutter/material.dart';

class FarmDetails extends StatelessWidget {
  const FarmDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farm Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 75,
                  width: double.infinity,
                  child: Text('Land Name',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
