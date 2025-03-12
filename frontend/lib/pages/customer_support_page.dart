import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

  Future<void> _launchWhatsApp() async {
    final Uri url =
        Uri.parse('https://api.whatsapp.com/send?phone=6285155344998');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint("❌ Could not open WhatsApp.");
    }
  }

  Future<void> _launchPhoneCall() async {
    final Uri url = Uri.parse('tel:+6285155344998');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint("❌ Could not make a call.");
    }
  }

  Future<void> _launchGoogleMaps() async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=-6.485134,106.832338');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint("❌ Could not open Google Maps.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Support"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSupportOption(
              icon: Icons.phone,
              title: "Call Us",
              subtitle: "+62 851-5534-4998",
              onTap: _launchPhoneCall,
            ),
            _buildSupportOption(
              icon: Icons.chat,
              title: "Chat via WhatsApp",
              subtitle: "Fast response support",
              onTap: _launchWhatsApp,
            ),
            _buildSupportOption(
              icon: Icons.location_on,
              title: "Visit Us",
              subtitle: "Jl. Tulip No. 16B, Rawa Panjang, Bojong Gede, Bogor",
              onTap: _launchGoogleMaps,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.navigate_next),
        onTap: onTap,
      ),
    );
  }
}
