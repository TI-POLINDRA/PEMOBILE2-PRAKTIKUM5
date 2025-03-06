import 'package:flutter/material.dart';

class ItemCardRecipe extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const ItemCardRecipe({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(child: Image.asset(image, fit: BoxFit.cover)),
          ),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}
