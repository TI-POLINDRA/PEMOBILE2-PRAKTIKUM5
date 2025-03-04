import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:praktikum_5/models/banner_model.dart';

class ApiService {
  static Future<List<BannerModel>> getBanners() async {
    final response = await http.get(
      Uri.parse('https://cms.cicd.my.id/items/fr_banners'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data.map((item) => BannerModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }

  // static Future<List<Banner>> getCategories() async {}
  // static Future<List<Banner>> getRecipes() async {}
  // static Future<List<Banner>> getReviews() async {}
}
