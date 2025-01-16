import 'package:flutter/material.dart';
import 'package:lineblocs/utils/app_font.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';

class ContatctDetailsScreen extends StatelessWidget {
  final String userName;
  final List<String> phoneNumbers;

  const ContatctDetailsScreen({
    super.key,
    required this.userName,
    required this.phoneNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         // backgroundColor: AppColor.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
            //  color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'Contact Details',
            style:
                AppFonts.boldTextStyle(fontSize: 20.0,
                   // color: AppColor.white
                ),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
               SizedBox(height: 10.w),
              // Profile Section
              const CircleAvatar(
                  radius: 50,
               //   backgroundColor: AppColor.primaryColor,
                  child: Icon(Icons.person, size: 60,
                 //   color: Colors.white,
                    )),
               SizedBox(height: 10.w),
              Text(userName,
                  style: AppFonts.boldTextStyle(
                    fontSize: 25.0,
                    //  color: AppColor.primaryColor
                  )
              ),
              SizedBox(height: 10.w),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    actionButton(Icons.call, "Call",AppColor.green),
                    actionButton(Icons.message, "Text",AppColor.yellow4),
                    actionButton(Icons.video_call, "Video",AppColor.blue),
                    //  actionButton(Icons.location_on, "Location"),
                  ],
                ),
              ),
              // Phone Numbers Section
              sectionTitle("Phone Numbers"),
              ...phoneNumbers.map((number) => ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(number,style: AppFonts.mediumTextStyle(
                        fontSize: 15.0,
                       // color: AppColor.primaryColor
                    )),
                    onTap: () => print("Tapped $number"), // Example action
                  )),
              const SizedBox(height: 20),
              // Contact Settings Section
              //   sectionTitle("Contact Settings"),
              // //  settingsTile(Icons.check_circle, "Defaults", phoneNumbers[0]["number"]!),
              //   settingsTile(Icons.music_note, "Contact Ringtone", "Default (ringtone_001)"),
              //   settingsTile(Icons.notifications, "Reminders", ""),
              //   settingsTile(Icons.share, "Share Contact", ""),
              //   settingsTile(Icons.home, "Add to Home Screen", ""),
              //   settingsTile(Icons.move_to_inbox, "Move to Another Account", ""),
              //   switchTile("Send to Voicemail", false),
              //   settingsTile(Icons.block, "Block Numbers", "", isDestructive: true),
              //   settingsTile(Icons.delete, "Delete", "", isDestructive: true),
            ],
          ),
        ),
      ),
    );
  }
}

// Action Button Widget (Fixed Row)
Widget actionButton(IconData icon, String label,Color color) {
  return Column(
    children: [
      Icon(icon, size: 35,color: color,),
      const SizedBox(height: 5),
      Text(label,style: AppFonts.mediumTextStyle(
          fontSize: 15.0,
         // color: AppColor.primaryColor
      )),
    ],
  );
}

// Section Title Widget
Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: AppFonts.boldTextStyle(
              fontSize: 20.0,
               // color: AppColor.primaryColor
          )),
    ),
  );
}

// Settings Tile Widget
Widget settingsTile(IconData icon, String title, String subtitle,
    {bool isDestructive = false}) {
  return ListTile(
    leading: Icon(icon, color: isDestructive ? Colors.red : null),
    title:
        Text(title, style: TextStyle(color: isDestructive ? Colors.red : null)),
    subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
    onTap: () {},
  );
}

// Toggle Switch Tile
Widget switchTile(String title, bool value) {
  return SwitchListTile(
    title: Text(title),
    value: value,
    onChanged: (bool newValue) {},
  );
}
