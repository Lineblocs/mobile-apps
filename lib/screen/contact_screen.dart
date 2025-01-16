//
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:contacts_service/contacts_service.dart';
//
// import 'contact_details_screen.dart';
//
// class ContactListScreen extends StatefulWidget {
//   @override
//   _ContactListScreenState createState() => _ContactListScreenState();
// }
// class _ContactListScreenState extends State<ContactListScreen> {
//   List<Contact> contacts = [];
//   @override
//   void initState() {
//     super.initState();
//     _requestContactsPermission();
//   }
//   Future<void> _requestContactsPermission() async {
//     var status = await Permission.contacts.request();
//     if (status.isGranted) {
//       _loadContacts();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Contacts permission denied!")),
//       );
//     }
//   }
//   Future<void> _loadContacts() async {
//     final Iterable<Contact> phoneContacts =
//     await ContactsService.getContacts(withThumbnails: false);
//     setState(() {
//       contacts = phoneContacts.toList();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Phone Contacts'),
//         actions: [
//           IconButton(onPressed: _loadContacts, icon: const Icon(Icons.refresh)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
//         ],
//       ),
//       body: contacts.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: contacts.length,
//         itemBuilder: (context, index) {
//           var contact = contacts[index];
//           List<String> phoneNumbers = contact.phones!
//               .map((phone) => phone.value ?? "No Number")
//               .toList();
//           return InkWell(onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => ContatctDetailsScreen(
//                   userName: contact.displayName ?? "No Name",
//                   phoneNumbers: contact.phones?.map((phone) => phone.value ?? "").toList() ?? [],
//                 ),
//               ),
//             );
//           },
//             child: ListTile(
//               leading: CircleAvatar(
//                 child: Text(contact.initials()),
//               ),
//               title: Text(contact.displayName ?? 'No Name'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: phoneNumbers
//                     .map((number) => Text(number, style: const TextStyle(color: Colors.grey)))
//                     .toList(),
//               ),
//             ),
//           );
//         },
//       ),
//
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';
import '../controller/theme_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import 'contact_details_screen.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];
  final ItemScrollController _scrollController = ItemScrollController();
  final ThemeController themeController = Get.put(ThemeController());

  @override
  void initState() {
    super.initState();
    _requestContactsPermission();
  }

  Future<void> _requestContactsPermission() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      _loadContacts();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Contacts permission denied!")),
      );
    }
  }

  Future<void> _loadContacts() async {
    final Iterable<Contact> phoneContacts =
        await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      contacts = phoneContacts.toList()
        ..sort((a, b) => (a.displayName ?? "").compareTo(b.displayName ?? ""));
    });
  }

  void _scrollToLetter(String letter) {
    final index = contacts.indexWhere((contact) =>
        contact.displayName != null &&
        contact.displayName!.toUpperCase().startsWith(letter));
    if (index != -1) {
      _scrollController.scrollTo(
          index: index, duration: const Duration(milliseconds: 300));
    }
  }

  @override
  Widget build(BuildContext context) {
    const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            themeController.isDarkMode.value ? null : AppColor.primaryColor,
        title: Text(
          'Phone Contacts',
          style: AppFonts.boldTextStyle(fontSize: 20.0, color: AppColor.white),
        ),
        actions: [
          IconButton(
              onPressed: _loadContacts,
              icon: const Icon(
                Icons.refresh,
                color: AppColor.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColor.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColor.white,
              )),
        ],
      ),
      body: contacts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Row(
              children: [
                Expanded(
                  child: ScrollablePositionedList.builder(
                    itemCount: contacts.length,
                    itemScrollController: _scrollController,
                    itemBuilder: (context, index) {
                      var contact = contacts[index];
                      Set<String> uniquePhoneNumbers = contact.phones!
                          .map((phone) => phone.value ?? "")
                          .where((name) => name.isNotEmpty)
                          .toSet()
                          .toSet();
                      List<String> phoneNumbers = uniquePhoneNumbers.toList();
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ContatctDetailsScreen(
                                userName: contact.displayName ?? "No Name",
                                phoneNumbers: phoneNumbers,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(contact.initials()),
                          ),
                          title: Text(contact.displayName ?? 'No Name',
                              style: AppFonts.boldTextStyle(
                                  fontSize: 4.w,
                                  color: themeController.isDarkMode.value
                                      ? AppColor.white
                                      : AppColor.primaryColor)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: phoneNumbers
                                .map((number) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Text(number,
                                          style: AppFonts.regularTextStyle(
                                            fontSize: 3.w,
                                            // color: AppColor.black
                                          )),
                                    ))
                                .toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    alphabet.length,
                    (index) => InkWell(
                      onTap: () => _scrollToLetter(alphabet[index]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 13),
                          child: Text(
                            alphabet[index],
                            style: AppFonts.boldTextStyle(
                                fontSize: 4.5.w,
                                color: themeController.isDarkMode.value
                                    ? AppColor.white
                                    : AppColor.primaryColor),
                          )),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
