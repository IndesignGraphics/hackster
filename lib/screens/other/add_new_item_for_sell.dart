import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewItemForSell extends StatefulWidget {
  const AddNewItemForSell({super.key});

  @override
  State<AddNewItemForSell> createState() => _AddNewItemForSellState();
}

class _AddNewItemForSellState extends State<AddNewItemForSell> {
  final _listOfCropType = ['Vegetables', 'Fruits', 'Cereals', 'Pulses'];
  final _listOfCropName = ['Wheat', 'Rice', 'Bajri'];
  final _listOfDistrict = [
    'Ahmedabad',
    'Junagadh',
    'Surat',
  ];
  final _listOfTaluka = [
    'Ahmedabad',
    'Junagadh',
    'Surat',
  ];

  var cropTypeValue = 'Vegetables';
  var cropNameValue = 'Wheat';
  var districtValue = 'Ahmedabad';
  var talukaValue = 'Ahmedabad';

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
        title: const Text('Add New Item'),
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
                      border: OutlineInputBorder(), labelText: 'Crop Type'),
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
                  height: 15,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Crop Name'),
                  value: cropNameValue,
                  items: _listOfCropName
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      cropNameValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) / 2.2,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Quantity',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) / 2.2,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Price',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) / 2.2,
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'District'),
                        value: districtValue,
                        items: _listOfDistrict
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            districtValue = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) / 2.2,
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Taluka'),
                        value: talukaValue,
                        items: _listOfTaluka
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            talukaValue = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Village/City',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact Number',
                  ),
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
                    'Apply for sell',
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
