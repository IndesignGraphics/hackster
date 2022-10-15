import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCrop extends StatefulWidget {
  const AddNewCrop({Key? key}) : super(key: key);

  @override
  State<AddNewCrop> createState() => _AddNewCropState();
}

class _AddNewCropState extends State<AddNewCrop> {
  final _listOfLand = ['Shivji Land', 'GandBha valu', 'Kharo'];
  final _listOfYear = ['2020', '2021', '2022', '2023'];
  final _listOfCropType = ['Vegetables', 'Fruits'];
  final _listOfVegetables = [
    'Potato',
    'Tomato',
    'Onion',
    'Garlic',
    'Chilli',
    'Carrot'
  ];
  final _listOfFruits = [
    'Apple',
    'Banana',
    'WaterMelon',
    'Guava',
    'Pomegranate'
  ];
  final _listOfUnits = ['Kg', '20 Kg', 'Ton'];
  final _listOfHarvesting = ['Hand Harvesting', 'Thresor', 'Cutter'];

  var landValue = 'Shivji Land';
  var yearValue = '2020';
  var cropTypeValue = 'Vegetables';
  var vegetablesValue = 'Potato';
  var fruitsValue = 'Apple';
  var harvestingValue = 'Hand Harvesting';
  var unitValue = 'Kg';

  final _formKey = GlobalKey<FormState>();

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImageFile;

  void selectImage(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Image from'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () async {
                  Navigator.pop(context);
                  _imageFile = await _picker.pickImage(
                    source: ImageSource.gallery,
                    maxHeight: 1000,
                    maxWidth: 1000,
                  );
                  setState(() {
                    _selectedImageFile = File(_imageFile?.path ?? '');
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.photo),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Gallery'),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () async {
                  Navigator.pop(context);
                  _imageFile = await _picker.pickImage(
                    source: ImageSource.camera,
                    maxHeight: 1000,
                    maxWidth: 1000,
                  );
                  setState(() {
                    _selectedImageFile = File(_imageFile?.path ?? '');
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.camera_alt),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Camera')
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Crop'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Land Title'),
                  value: landValue,
                  items:
                      _listOfLand.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      landValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Year',
                  ),
                  value: yearValue,
                  items:
                      _listOfYear.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      yearValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Crop Type',
                  ),
                  value: cropTypeValue,
                  items: _listOfCropType
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      cropTypeValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Crop Name',
                  ),
                  value: cropTypeValue == 'Vegetables'
                      ? vegetablesValue
                      : fruitsValue,
                  items: cropTypeValue == 'Vegetables'
                      ? _listOfVegetables
                          .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()
                      : _listOfFruits
                          .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      cropTypeValue == 'Vegetables'
                          ? vegetablesValue = value!
                          : fruitsValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Quantity',
                    labelText: 'Quantity',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Unit'
                  ),
                  value: unitValue,
                  items: _listOfUnits
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      unitValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Total Price',
                      labelText: 'Total Price'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Harvesting Technique',
                  ),
                  value: harvestingValue,
                  items: _listOfHarvesting
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      harvestingValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: _imageFile == null
                      ? IconButton(
                    onPressed: () {
                      selectImage(context);
                    },
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 50,
                    ),
                  )
                      : Image.file(_selectedImageFile!),
                ),
                const SizedBox(height: 20,),
                if(_imageFile != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(
                            width: 2.0
                        )
                    ),
                    onPressed: () {
                      selectImage(context);
                    },
                    child: Text(
                      'Change Photo',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
