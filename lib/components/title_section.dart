import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TitleSection({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            TextButton.icon(
              onPressed: onPressed,
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              label: Text("Lihat Semua"),
              icon: Icon(Icons.arrow_forward_ios),
              iconAlignment: IconAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
