import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  String productId;
  String categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'categoryId': categoryId,
    };
  }

  factory ProductCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ProductCategoryModel(
      productId: data['productId'] as String,
      categoryId: data['categoryId'] as String,
    );
  }
}
