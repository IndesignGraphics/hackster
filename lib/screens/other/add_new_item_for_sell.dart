import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hackster/controller/farmer_controller.dart';
import 'package:hackster/controller/sell_controller.dart';
import 'package:hackster/models/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

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
  final _listOfUnits = ['Kg', '20Kg(મણ)', 'Ton'];

  var cropTypeValue = 'Vegetables';
  var cropNameValue = 'Wheat';
  var districtValue = 'Ahmedabad';
  var talukaValue = 'Ahmedabad';
  var unitValue = 'Kg';

  final _formKey = GlobalKey<FormState>();

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  late Product _product;
  String imageBaseString = '';

  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  var villageCityController = TextEditingController();
  var contactController = TextEditingController();

  final FarmerController farmerController = Get.put(FarmerController());
  final SellController sellController = Get.put(SellController());

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
                  imageQuality: 80,
                  maxHeight: 500,
                  maxWidth: 500,
                );
                if (_imageFile == null) return;
                Uint8List? imageBytes = await _imageFile?.readAsBytes();
                setState(() {
                  imageBaseString = base64.encode(imageBytes!);
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
                  imageQuality: 80,
                    maxHeight: 500,
                    maxWidth: 500,
                );
                if (_imageFile == null) return;
                Uint8List? imageBytes = await _imageFile?.readAsBytes();
                setState(() {
                  imageBaseString = base64.encode(imageBytes!);
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
      },
    );
  }

  showProgressDialog() {
    Get.defaultDialog(
      title: 'Wait',
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          Text('Loading....'),
        ],
      ),
      barrierDismissible: false,
    );
  }

  void submitForm() async {
    showProgressDialog();
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      Get.back();
      return;
    }
    if (imageBaseString == '') {
      Get.back();
      Get.defaultDialog(
        title: "Image",
        content: const Text("Please select image of your item."),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, foregroundColor: Colors.white),
          child: const Text("OK"),
        ),
        barrierDismissible: false,
      );
    }
    _product = Product(
      cropType: cropTypeValue,
      cropName: cropNameValue,
      quantity: quantityController.text,
      price: priceController.text,
      unit: unitValue,
      description: descriptionController.text,
      district: districtValue,
      taluka: talukaValue,
      villageCity: villageCityController.text,
      contactNumber: contactController.text,
      image: imageBaseString,
      sellerId: farmerController.farmerID.toString(),
    );
    await sellController.sellItem(_product);
    setState(() {
      _imageFile = null;
      quantityController.clear();
      priceController.clear();
      descriptionController.clear();
      villageCityController.clear();
      contactController.clear();
    });
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
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
                      width: (MediaQuery.of(context).size.width) / 3.5,
                      child: TextFormField(
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Quantity',
                        ),
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return "Please Enter Quantity";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) / 3.5,
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Price',
                        ),
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return "Please Enter Price";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) / 3,
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Unit'),
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                  validator: (val) {
                    if (val.toString().isEmpty) {
                      return "Please Enter Description";
                    }
                    return null;
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
                  controller: villageCityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Village/City',
                  ),
                  validator: (val) {
                    if (val.toString().isEmpty) {
                      return "Please Enter Village/City";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: contactController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact Number',
                  ),
                  validator: (val) {
                    if (val.toString().isEmpty) {
                      return "Please Enter Contact Number";
                    }
                    if (val.toString().length != 10) {
                      return "Please enter valid contact number";
                    }
                    return null;
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
                      : Image.memory(base64Decode(imageBaseString)),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_imageFile != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(width: 2.0)),
                    onPressed: () {
                      selectImage(context);
                    },
                    child: Text(
                      'Change Photo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    submitForm();
                  },
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
