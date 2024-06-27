// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/profile/payment_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'English'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  SizedBox(width: 4), // Add spacing between icon and text
                  Text('Back'), // Display "Back" text beside the icon
                ],
              ),
          ),
          Spacer(),
          Text(
              'Setting',
              textAlign: TextAlign.center,
          ), // Centered "Setting" text
          Spacer(),
          TextButton(
            onPressed: () {
              // Perform actions when the "OK" button is pressed
              // For example, you can save the selected language and navigate back
              Navigator.of(context).pop(_selectedLanguage);
            },
            child: Text(
              'OK',
              // style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          buildLanguageTile('English'),
          buildLanguageTile('Japanese'),
        ],
      ),
    );
  }

  Widget buildLanguageTile(String language) {
    return ListTile(
      title: Text(language),
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      trailing: _selectedLanguage == language ? Icon(Icons.check, color: Colors.blue,) : null,
    );
  }
}
