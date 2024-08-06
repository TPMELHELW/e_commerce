import 'package:e_commerce/data/category_repository.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/function/snack_bar.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instace => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  late StatusRequest statusRequest;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    getAllGategories();
    super.onInit();
  }

  Future getAllGategories() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      final List<CategoryModel> data =
          await _categoryRepository.getAllCategory();
      allCategories.assignAll(data);
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }
}
