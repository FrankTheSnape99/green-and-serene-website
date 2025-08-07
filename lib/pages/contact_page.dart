import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_and_serene/widgets/website_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final String phoneNumber = '020 7272 0492';
  final String email = 'info@greenandserene.co.uk';
  final String address =
      '6 Navigator Square, Archway,\nLondon N19 3TD, United Kingdom';
  final String instagram = 'https://instagram.com/nathalieskitchenuk';
  final String tiktok = 'https://tiktok.com/@nathalies.kitchen';
  final String x = 'https://x.com/NathaliesLondon';

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebsiteScaffold(
      title: 'Contact',
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Section 1 - Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              color: const Color(0xFFE6F2E4), // soft green
              child: Column(
                children: [
                  Text(
                    'Get in Touch',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Questions? Bookings? Collaborations?\nWe’d love to hear from you!',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Colors.green[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Section 2 - Contact Info
            Container(
              width: double.infinity,
              color: const Color(0xFFFFFBF5), // off white
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildContactCard(
                    context,
                    icon: Icons.phone,
                    label: 'Phone',
                    value: phoneNumber,
                    onTap: () => _launchUrl('tel:$phoneNumber'),
                  ),
                  _buildContactCard(
                    context,
                    icon: Icons.email,
                    label: 'Email',
                    value: email,
                    onTap: () => _launchUrl('mailto:$email'),
                  ),
                  _buildContactCard(
                    context,
                    icon: Icons.location_on,
                    label: 'Address',
                    value: address,
                    onTap: () => _launchUrl(
                      'https://www.google.com/maps/search/?api=1&query=Nathalie\'s+Kitchen+Archway+London',
                    ),
                  ),
                ],
              ),
            ),

            // Section 3 - Social Media
            Container(
              width: double.infinity,
              color: const Color(0xFFE6F2E4),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Text(
                    'Follow Us',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(
                        icon: FontAwesomeIcons.instagram,
                        label: 'Instagram',
                        url: instagram,
                      ),
                      const SizedBox(width: 40),
                      _buildSocialIcon(
                        icon: FontAwesomeIcons.tiktok,
                        label: 'TikTok',
                        url: tiktok,
                      ),
                      const SizedBox(width: 40),
                      _buildSocialIcon(
                        icon: FontAwesomeIcons.x,
                        label: 'X',
                        url: x,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green[900],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.green[800],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[700],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.openSans(fontSize: 14, color: Colors.green[800]),
          ),
        ],
      ),
    );
  }
}
