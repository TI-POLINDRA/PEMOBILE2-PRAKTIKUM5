import 'package:flutter/material.dart';
import 'package:praktikum_5/configs/demo.dart';
import 'package:praktikum_5/models/category_model.dart';
import 'package:praktikum_5/services/api_service.dart';

class FoodCategories extends StatefulWidget {
  const FoodCategories({super.key});

  @override
  _FoodCategoriesState createState() => _FoodCategoriesState();
}

class _FoodCategoriesState extends State<FoodCategories> {
  late Future<List<CategoryModel>> _futureCategories;

  @override
  void initState() {
    super.initState();
    _futureCategories = ApiService.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Tidak ada data kategori'));
        } else {
          return SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final CategoryModel category = snapshot.data![index];
                print('Category ${category.name} ditampilkan');
                return Container(
                  margin: EdgeInsets.only(left: index == 0 ? 16 : 0),
                  width: 100,
                  child: GestureDetector(
                    onTap: () {
                      // Aksi ketika item diklik
                      print('Category ${categories[index]['name']} diklik');
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://cms.cicd.my.id/assets/${category.image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(category.name),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
