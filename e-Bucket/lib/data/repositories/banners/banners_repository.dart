import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getAllBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      final list = result.docs
          .map((document) => BannerModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Banners to the Cloud Firebase
  Future<void> uploadDummyBanners(List<BannerModel> banners) async {
    try {
// Upload all the Banners along with their Images
      final storage = Get.put(TFirebaseStorageService());

// Loop through each banner
      for (var banner in banners) {
// Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
// Upload Image and Get its URL
        final url =
            await storage.uploadImageData('Banners', file, banner.targetScreen);
// Assign URL to Banner. image attribute
        banner.imageUrl = url;
// Store Banners in Firestore
        await _db.collection("Banners").doc().set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
