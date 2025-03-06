import 'package:flutter/material.dart';
import 'package:praktikum_5/components/banner_carousel.dart';
import 'package:praktikum_5/components/food_categories.dart';
import 'package:praktikum_5/components/item_card_recipe.dart';
import 'package:praktikum_5/components/title_section.dart';
import 'package:praktikum_5/configs/demo.dart';
import 'package:praktikum_5/screens/recipe_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Resep Makanan'.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.amber,
              ),
            ),
            Text(
              'Masak Sendiri Kesukaanmu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        leading: Icon(Icons.menu),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(child: BannerCarousel()),
          ),
          TitleSection(title: "Jenis Makanan", onPressed: () {}),
          // SliverToBoxAdapter(child: FoodCategories()),
          TitleSection(title: "Resep", onPressed: () {}),
          // make list 2 grid column
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 0,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                // in each item give image and text below it
                (context, index) => ItemCardRecipe(
                  image: banners[index],
                  title: "Resep Makanan ${index + 1}",
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(),
                        ),
                      ),
                ),
                childCount: banners.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
