import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_and_serene/widgets/website_scaffold.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // List of sections — you can update the text/image paths later
    final sections = [
      {
        'text': 'We are a small independent café with a passion for health and flavour.',
        'image': 'assets/images/coffee.jpg',
        'bgColor': const Color(0xFFFFFBF5),
      },
      {
        'text': 'Every dish is made from scratch daily, using local ingredients.',
        'image': 'assets/images/palenta.jpg',
        'bgColor': const Color(0xFFE5F4E3),
      },
      {
        'text': 'Sustainability is at the heart of everything we do.',
        'image': 'assets/images/salad.jpg',
        'bgColor': const Color(0xFFF3F1FF),
      },
      {
        'text': 'Our team is small, friendly, and dedicated to making you feel at home.',
        'image': 'assets/images/inside_shop.jpg',
        'bgColor': const Color(0xFFFDF3F3),
      },
      {
        'text': 'We cater for all diets — with lots of vegan, gluten-free, and allergy-friendly options.',
        'image': 'assets/images/about5.jpg',
        'bgColor': const Color(0xFFFFF7DE),
      },
      {
        'text': 'Community is everything — we support local growers, charities and neighbours.',
        'image': 'assets/images/about6.jpg',
        'bgColor': const Color(0xFFE7F3F8),
      },
    ];

    return WebsiteScaffold(
      title: 'About Us',
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(sections.length, (index) {
            final section = sections[index];
            final isEven = index % 2 == 0;

            return Container(
              color: section['bgColor'] as Color,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 700;
                  return Flex(
                    direction: isWide ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: isEven
                        ? [
                            // Text on left
                            _buildTextBlock(section['text'] as String, textTheme),
                            const SizedBox(width: 40, height: 40),
                            _buildImageBlock(section['image'] as String),
                          ]
                        : [
                            // Image on left
                            _buildImageBlock(section['image'] as String),
                            const SizedBox(width: 40, height: 40),
                            _buildTextBlock(section['text'] as String, textTheme),
                          ],
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTextBlock(String text, TextTheme textTheme) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge?.copyWith(
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: Colors.green[800],
          ),
        ),
      ),
    );
  }

  Widget _buildImageBlock(String imagePath) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
