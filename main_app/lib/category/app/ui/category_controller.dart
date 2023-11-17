import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:main_app/category/domain/model/category_model.dart';
import 'package:main_app/storage/local_storage.dart';

class CategoryControler extends GetxController {
  final _listCategory = RxList<CategoryModel>(const []);
  List<CategoryModel> get listCategory => _listCategory.toList();

  final _isSelected = RxBool(false);
  bool get isSelected => _isSelected.value;

  final _listSelected = RxList<CategoryModel>(const []);
  List<CategoryModel> get listSelected => _listSelected.toList();

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    try {
      final token = await SPref.instance.getAccessToken();
      print("~~~~~~~token $token");
      final response = await get(Uri.parse("http://streaming.nexlesoft.com:3001/categories"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print("~~~~~~~res $response");

      var data = jsonDecode(response.body);

      List<CategoryModel> listCategories = List<CategoryModel>.from(data.map((model) => CategoryModel.fromJson(model)));

      if (response.statusCode == 200) {
        debugPrint("~~~~~~~~~~1");
        _listCategory.addAll(listCategories);
      } else {
        debugPrint("~~~~~~~~~~2");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint("~~~~~~~~~~3");
      throw Exception('Failed to load data');
    }
  }

  void selectedCategory({required CategoryModel categoryModel}) async {
    _listSelected.contains(categoryModel) ? _listSelected.remove(categoryModel) : _listSelected.add(categoryModel);
    print("~~~~~~~~~~~ $listSelected");
  }
}
