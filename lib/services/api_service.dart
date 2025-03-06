import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:praktikum_5/models/banner_model.dart';

class ApiService {
  static Future<List<BannerModel>> getBanners() async {
    final response = await http.get(
      Uri.parse(
        'https://cms.cicd.my.id/items/fr_banners?filter[status][_eq]=published',
      ),
    );
    if (response.statusCode == 200) {
      final dynamic body = jsonDecode(response.body);
      final List<dynamic> data = body['data'];
      return data.map((item) => BannerModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
