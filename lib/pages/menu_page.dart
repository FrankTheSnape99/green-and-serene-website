import 'package:flutter/material.dart';
import 'package:green_and_serene/widgets/website_scaffold.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // List of menu image file paths
  final List<String> menuImages = const [
    'assets/images/NKMenu.jpg',
    'assets/images/DrinksMenu.jpg',
    'assets/images/PancakesMenu.jpg',
    'assets/images/SmoothiesMenu.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return WebsiteScaffold(
      title: 'Menu',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(menuImages.length * 2 - 1, (index) {
            if (index.isOdd) {
              // Insert Divider between images
              return const Divider(
                thickness: 1.5,
                color: Colors.green,
                height: 40,
              );
            } else {
              // Show menu image
              final imageIndex = index ~/ 2;
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600, // Set a maximum width for the image
                  ),
                  child: Image.asset(
                    menuImages[imageIndex],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
