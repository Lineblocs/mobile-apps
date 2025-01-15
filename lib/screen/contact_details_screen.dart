// import 'package:flutter/material.dart';
//
// class ContatctDetailsScreen extends StatelessWidget {
//   const ContatctDetailsScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.arrow_back),
//         actions: const [
//           Icon(Icons.edit),
//           SizedBox(width: 15),
//           Icon(Icons.star_border),
//           SizedBox(width: 15),
//           Icon(Icons.settings),
//           SizedBox(width: 15),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Profile Section
//             const CircleAvatar(
//               radius: 70,
//               backgroundColor: Colors.amber,
//               child: Text(
//                 "A",
//                 style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "Anjali",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             // Action Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 actionButton(Icons.call, "Call"),
//                 actionButton(Icons.message, "Text"),
//                 actionButton(Icons.video_call, "Video"),
//                 actionButton(Icons.location_on, "Location"),
//               ],
//             ),
//             const SizedBox(height: 30),
//             // Contact Info Section
//             sectionTitle("Contact Info"),
//             ContactTile(number: "+91 95124 92911", label: "Mobile • Default"),
//             ContactTile(number: "+91 11 1111 1111", label: "Work"),
//             ContactTile(number: "+91 2333 666 9669", label: "Home"),
//             const SizedBox(height: 20),
//             // Contact Settings Section
//             sectionTitle("Contact Settings"),
//             settingsTile(Icons.check_circle, "Defaults", "+91 95124 92911"),
//             settingsTile(Icons.music_note, "Contact Ringtone", "Default (ringtone_001)"),
//             settingsTile(Icons.notifications, "Reminders", ""),
//             settingsTile(Icons.share, "Share Contact", ""),
//             settingsTile(Icons.home, "Add to Home Screen", ""),
//             settingsTile(Icons.move_to_inbox, "Move to Another Account", ""),
//             switchTile("Send to Voicemail", false),
//             settingsTile(Icons.block, "Block Numbers", "", isDestructive: true),
//             settingsTile(Icons.delete, "Delete", "", isDestructive: true),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // Action Button Widget
// Widget actionButton(IconData icon, String label) {
//   return Column(
//     children: [
//       Icon(icon, size: 35),
//       const SizedBox(height: 5),
//       Text(label),
//     ],
//   );
// }
// // Section Title Widget
// Widget sectionTitle(String title) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//     child: Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//       ),
//     ),
//   );
// }
// // Contact Tile Widget
// class ContactTile extends StatelessWidget {
//   final String number;
//   final String label;
//   const ContactTile({super.key, required this.number, required this.label});
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: const Icon(Icons.phone),
//       title: Text(number),
//       subtitle: Text(label),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: const [
//           Icon(Icons.video_call),
//           SizedBox(width: 10),
//           Icon(Icons.message),
//         ],
//       ),
//     );
//   }
// }
// // Settings Tile Widget
// Widget settingsTile(IconData icon, String title, String subtitle, {bool isDestructive = false}) {
//   return ListTile(
//     leading: Icon(icon, color: isDestructive ? Colors.red : null),
//     title: Text(title, style: TextStyle(color: isDestructive ? Colors.red : null)),
//     subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
//     onTap: () {},
//   );
// }
// // Toggle Switch Tile
// Widget switchTile(String title, bool value) {
//   return SwitchListTile(
//     title: Text(title),
//     value: value,
//     onChanged: (bool newValue) {},
//   );
// }
//
//
//

import 'package:flutter/material.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(userName),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Fixed Action Bar

            const SizedBox(height: 20),
            // Profile Section
            const CircleAvatar(radius: 70, backgroundColor: Colors.amber, child: Icon(Icons.person, size: 60)),
            const SizedBox(height: 10),
            Text(userName, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(


              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  actionButton(Icons.call, "Call"),
                  actionButton(Icons.message, "Text"),
                  actionButton(Icons.video_call, "Video"),
                //  actionButton(Icons.location_on, "Location"),
                ],
              ),
            ),
            // Phone Numbers Section
            sectionTitle("Phone Numbers"),
            ...phoneNumbers.map((number) => ListTile(
              leading: const Icon(Icons.phone),
              title: Text(number),
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


    );
  }
}
// Action Button Widget (Fixed Row)
Widget actionButton(IconData icon, String label) {
  return Column(
    children: [
      Icon(icon, size: 35),
      const SizedBox(height: 5),
      Text(label),
    ],
  );
}
// Section Title Widget
Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    ),
  );
}
// Settings Tile Widget
Widget settingsTile(IconData icon, String title, String subtitle, {bool isDestructive = false}) {
  return ListTile(
    leading: Icon(icon, color: isDestructive ? Colors.red : null),
    title: Text(title, style: TextStyle(color: isDestructive ? Colors.red : null)),
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