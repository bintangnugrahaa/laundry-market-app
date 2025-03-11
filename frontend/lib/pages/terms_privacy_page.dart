import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/app_colors.dart';

class TermsPrivacyPage extends StatelessWidget {
  const TermsPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Terms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Privacy Policy'),
              _buildSectionContent(
                  "We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data in compliance with industry standards."),
              _buildSectionContent(
                  "By using our services, you consent to the collection and processing of your data, including but not limited to your name, contact details, and transaction history, for service improvement and security purposes."),
              _buildSectionTitle('Terms of Service'),
              _buildSectionContent(
                  "By accessing and using our application, you agree to comply with our terms and conditions. Unauthorized use, fraudulent activity, or violation of applicable laws may result in account suspension or legal actions."),
              _buildSectionContent(
                  "All content within this application, including trademarks and intellectual property, remains the exclusive property of our company. Any unauthorized reproduction or distribution is strictly prohibited."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }
}
