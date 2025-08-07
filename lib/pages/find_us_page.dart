import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_and_serene/widgets/website_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  final String address =
      '6 Navigator Square, Archway, London N19 3TD, United Kingdom';
  final String mapsUrl =
      'https://www.google.com/maps/search/?api=1&query=Nathalie\'s+Kitchen+Archway+London';

  void _openGoogleMaps() async {
    final Uri uri = Uri.parse(mapsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $mapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return WebsiteScaffold(
      title: 'Find Us',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              'Come Visit Us',
              style: textTheme.headlineSmall?.copyWith(
                fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // Address
            Text(
              address,
              style: textTheme.bodyMedium?.copyWith(
                fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Opening hours
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Opening Hours',
                  style: textTheme.titleLarge?.copyWith(
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    color: Colors.green[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                for (final day in [
                  'Monday: CLOSED',
                  'Tuesday: 8:30 AM - 5:00 PM',
                  'Wednesday: 8:30 AM - 5:00 PM',
                  'Thursday: 8:30 AM - 5:00 PM',
                  'Friday: 8:30 AM - 5:00 PM',
                  'Saturday: 9:00 AM - 5:00 PM',
                  'Sunday: 10:00 AM - 4:00 PM',
                ])
                  Text(
                    day,
                    style: textTheme.bodyMedium?.copyWith(
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 30),

            // Divider
            const Divider(thickness: 1.2, color: Colors.grey),

            const SizedBox(height: 30),

            // Map Image
            GestureDetector(
              onTap: _openGoogleMaps,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/map_preview.jpg',
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),
            Text(
              'Tap the map to open in Google Maps',
              style: textTheme.bodySmall?.copyWith(
                fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}