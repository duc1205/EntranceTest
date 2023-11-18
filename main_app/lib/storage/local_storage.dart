import 'dart:convert';

import 'package:main_app/category/domain/model/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPref {
  static const keyAccessToken = 'OAUTH2_ACCESS_TOKEN';
  static const keyRefreshToken = 'OAUTH2_REFRESH_TOKEN';
  static const keyCategory = 'KEY_CATEGORY';

  static final SPref instance = SPref._internal();

  SPref._internal();

  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyAccessToken);
  }

  Future setAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyAccessToken, token);
  }

  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyRefreshToken);
  }

  Future saveRefreshToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyRefreshToken, token);
  }

  Future<List<CategoryModel>> getCategory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final listCategory = prefs.getString(keyCategory);
    List<CategoryModel> listData = [];
    if (listCategory != null) {
      final data = jsonDecode(listCategory) as List;
      listData = data.map((e) => CategoryModel.fromJson(e)).toList();
    }
    return listData;
  }

  Future saveCategory(List<CategoryModel> listCategory) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyCategory, json.encode(listCategory.map((c) => c.toJson()).toList()));
  }

  dynamic deleteAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final strLocale = prefs.getString('locale');
    await prefs.clear();
    if (strLocale != null) {
      await prefs.setString('locale', strLocale);
    }
  }
}
