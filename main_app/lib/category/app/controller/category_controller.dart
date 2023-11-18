import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:main_app/app_service.dart';
import 'package:main_app/category/domain/model/category_model.dart';
import 'package:main_app/storage/local_storage.dart';

class CategoryControler extends GetxController {
  final _listCategory = RxList<CategoryModel>(const []);
  List<CategoryModel> get listCategory => _listCategory.toList();

  final _listSelected = RxList<CategoryModel>(const []);
  List<CategoryModel> get listSelected => _listSelected.toList();

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    getCategory();
    getCategoryLocal();
  }

  void getCategory() async {
    try {
      final token = await SPref.instance.getAccessToken();
      final response = await _apiService.get('/categories', options: Options(headers: {"Authorization": 'Bearer $token'}));

      List<CategoryModel> listCategories = List<CategoryModel>.from(response.data.map((model) => CategoryModel.fromJson(model)));

      if (response.statusCode == 200) {
        _listCategory.addAll(listCategories);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  void selectedCategory({required CategoryModel categoryModel}) async {
    _listSelected.contains(categoryModel) ? _listSelected.remove(categoryModel) : _listSelected.add(categoryModel);
    await SPref.instance.saveCategory(listSelected);
  }

  void getCategoryLocal() async {
    _listSelected.value = await SPref.instance.getCategory();
  }
}
