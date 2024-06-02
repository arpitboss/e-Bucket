import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(
        id: '',
        name: '',
        image: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductsCount': productsCount,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    final data = json;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: json['Id'] ?? '',
      name: json['Name'] ?? '',
      image: json['Image'] ?? '',
      isFeatured: json['IsFeatured'] ?? false,
      productsCount: int.parse((json['ProductsCount'] ?? 0).toString()),
    );
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      final data = snapshot.data()!;

      return BrandModel(
        id: snapshot.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
      );
    } else {
      return BrandModel.empty();
    }
  }
}
