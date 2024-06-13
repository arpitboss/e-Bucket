import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  String brandId;
  String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'categoryId': categoryId,
    };
  }

  factory BrandCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return BrandCategoryModel(
      brandId: data['brandId'] as String,
      categoryId: data['categoryId'] as String,
    );
  }
}
