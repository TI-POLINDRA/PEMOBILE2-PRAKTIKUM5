import 'package:flutter/material.dart';

class ItemCardRecipe extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;

  const ItemCardRecipe({
    Key? key,
    required this.image,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 170,
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(name),
        ],
      ),
    );
  }
}
