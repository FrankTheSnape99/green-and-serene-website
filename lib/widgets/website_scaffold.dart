import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebsiteScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const WebsiteScaffold({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5), // Off-white background
      body: Column(
        children: [
          // TOP NAV BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    //left nav buttons
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _navButton(context, 'Menu', '/menu'),
                        const SizedBox(width: 12),
                        _navButton(context, 'Find Us', '/location'),
                      ],
                    ),
                    //CENTER LOGO
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/home'),
                      child: Text(
                        'Green & Serene',
                        style: GoogleFonts.playfairDisplay(
                          textStyle: TextStyle(
                            fontSize: 28,
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    //right nav buttons
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _navButton(context, 'About Us', '/about'),
                        const SizedBox(width: 12),
                        _navButton(context, 'Contact', '/contact'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          // GREEN DIVIDER LINE
          Container(
            height: 1,
            color: const Color(0xFF1C5A3D), // Dark green
            width: double.infinity,
          ),
          // Page content
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Color(0xFF1C5A3D)),
      ),
    );
  }
}
