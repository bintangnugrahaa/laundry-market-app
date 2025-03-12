import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ ',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFAQItem(
            'How can I place a laundry service order?',
            'You can place a laundry order via the application by selecting the service type, entering your address, and confirming your request.',
          ),
          _buildFAQItem(
            'How long does the laundry process take?',
            'The duration depends on the selected service type, typically ranging from 1 to 3 business days.',
          ),
          _buildFAQItem(
            'Is pickup and delivery service available?',
            'Yes, we provide pickup and delivery services, either free or at an additional cost depending on ongoing promotions.',
          ),
          _buildFAQItem(
            'What payment methods are accepted?',
            'Payments can be made via bank transfer, e-wallets (GoPay, OVO, Dana), or cash upon delivery.',
          ),
          _buildFAQItem(
            'What should I do if I encounter an issue with my order?',
            'Please contact our customer service team via the Support menu for assistance.',
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(answer, style: const TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
