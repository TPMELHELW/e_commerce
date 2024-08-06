import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final data = snapshot.docs.map(CategoryModel.fromSnapshot).toList();
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
