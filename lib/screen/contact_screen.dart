import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';

import '../../controller/theme_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font.dart';
import 'contact_details_screen.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact>? contacts;
  bool _permissionDenied = false;
  final ItemScrollController _scrollController = ItemScrollController();
  final ThemeController themeController = Get.find();

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contactss = await FlutterContacts.getContacts(withProperties: true, withPhoto: true);
      setState(() => contacts = contactss);
    }
  }

  void _scrollToLetter(String letter) {
    final index = contacts?.indexWhere((contact) =>
        contact.displayName.toUpperCase().startsWith(letter));
    if (index != -1) {
      _scrollController.scrollTo(
          index: index!, duration: const Duration(milliseconds: 300));
    }
  }

  @override
  Widget build(BuildContext context) {
    const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeController.isDarkMode.value ? null : AppColor.primaryColor,
        title: Text(
          'Phone Contacts',
          style: AppFonts.boldTextStyle(fontSize: 20.0, color: AppColor.white),
        ),
        actions: [
          IconButton(
              onPressed: _fetchContacts,
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
      body: _permissionDenied ? Center(child: Text('Permission denied')): Row(
        children: [
          Expanded(
            child: contacts == null
                ? Center(child: CircularProgressIndicator())
                : ScrollablePositionedList.builder(
              itemCount: contacts!.length,
              itemScrollController: _scrollController,
              itemBuilder: (context, index) {
                var contact = contacts![index];
                Set<String> uniquePhoneNumbers = contact.phones
                    .map((phone) => phone.number ?? "")
                    .where((number) => number.isNotEmpty)
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
                      child: Text((contact.name.first.isNotEmpty
                          ? contact.name.first[0].toUpperCase(): "") +
                          (contact.name.last.isNotEmpty
                              ? contact.name.last[0].toUpperCase()
                              : "" ),
                      ),),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact.displayName ?? 'No Name',
                          style: AppFonts.boldTextStyle(
                            fontSize: 4.w,
                            color: themeController.isDarkMode.value
                                ? AppColor.white
                                : AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: phoneNumbers
                          .map((number) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          number,
                          style: AppFonts.regularTextStyle(
                            fontSize: 3.w,
                            color: themeController.isDarkMode.value
                                ? AppColor.white
                                : AppColor.primaryColor,
                          ),
                        ),
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
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 13),
                  child: Text(
                    alphabet[index],
                    style: AppFonts.boldTextStyle(
                      fontSize: 4.5.w,
                      color: themeController.isDarkMode.value
                          ? AppColor.white
                          : AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}