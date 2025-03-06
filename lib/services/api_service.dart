import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:praktikum_5/models/banner_model.dart';
import 'package:praktikum_5/models/category_model.dart';

class ApiService {
  static final _baseUrl = 'https://cms.cicd.my.id/items';

  static Future<List<BannerModel>> getBanners() async {
    final response = await http.get(Uri.parse('$_baseUrl/fr_banners'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data.map((item) => BannerModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }

  static Future<List<CategoryModel>> getCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/fr_categories'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // static Future<List<Banner>> getRecipes() async {}
  // static Future<List<Banner>> getReviews() async {}
}
