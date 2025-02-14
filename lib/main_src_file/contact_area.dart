import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard: $text')),
    );
  }

  Widget contactInfo(
      BuildContext context, IconData icon, String label, String info) {
    return InkWell(
      onTap: () => copyToClipboard(context, info),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blueAccent, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: normalText.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: '$label ',
                      style: normalText.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: info),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact', style: headingText),
            const Divider(),
            contactInfo(
                context, Icons.email, 'Email:', 'oraclesolutions02@gmail.com'),
            contactInfo(context, Icons.phone, 'Phone:', '+91 93408 00455'),
            contactInfo(
              context,
              Icons.location_on,
              'Address:',
              '604, Scheme 134, Vijay Nagar, Indore, Madhya Pradesh 452010, India',
            ),
          ],
        ),
      ),
    );
  }
}
