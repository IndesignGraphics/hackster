class Product {
  String? cropType,
      cropName,
      unit,
      description,
      district,
      taluka,
      villageCity,
      contactNumber,
      image,
      quantity,
      price,
      sellerId;


  Product({
    required this.cropType,
    required this.cropName,
    required this.quantity,
    required this.price,
    required this.unit,
    required this.description,
    required this.district,
    required this.taluka,
    required this.villageCity,
    required this.contactNumber,
    required this.image,
    required this.sellerId,
  });
}
