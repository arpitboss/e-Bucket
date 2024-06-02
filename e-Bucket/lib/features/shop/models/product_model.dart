import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

import 'brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(
      id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Stock': stock,
      'SKU': sku,
      'Price': price,
      'Title': title,
      'Date': date?.toIso8601String(),
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'Description': description,
      'CategoryId': categoryId,
      'Images': images,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    if (data.isEmpty) return ProductModel.empty();
    return ProductModel(
      id: snapshot['Id'],
      stock: snapshot['Stock'] ?? 0,
      sku: snapshot['SKU'],
      price: double.parse((snapshot['Price'] ?? 0.0).toString()),
      title: snapshot['Title'],
      date: snapshot['Date'] != null ? DateTime.parse(snapshot['Date']) : null,
      salePrice: double.parse((snapshot['SalePrice'] ?? 0.0).toString()),
      thumbnail: snapshot['Thumbnail'],
      isFeatured: snapshot['IsFeatured'] ?? false,
      brand: snapshot['Brand'] != null
          ? BrandModel.fromJson(snapshot['Brand'])
          : null,
      description: snapshot['Description'] ?? '',
      categoryId: snapshot['CategoryId'] ?? '',
      images: snapshot['Images'] != null
          ? List<String>.from(snapshot['Images'])
          : [],
      productType: snapshot['ProductType'] ?? '',
      productAttributes: (snapshot['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (snapshot['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      sku: data['SKU'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      title: data['Title'],
      date: data['Date'] != null ? DateTime.parse(data['Date']) : null,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'],
      isFeatured: data['IsFeatured'] ?? false,
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productType: data['ProductType'] ?? '',
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
