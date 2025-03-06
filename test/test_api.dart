import 'package:http/http.dart' as http;

void main() async {
  var url = 'https://cms.cicd.my.id/items/fr_banners';
  var response = await http.get(Uri.parse(url));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

// Run the code
// dart test/test_api.dart
