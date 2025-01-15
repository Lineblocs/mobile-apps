// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
// import '../model/chat_user_list_model.dart';
// import '../utils/app_colors.dart';
// import '../utils/app_font.dart';
// import 'chat/chat_screen.dart';
//
// class MessageScreen extends StatefulWidget {
//   const MessageScreen({super.key});
//
//   @override
//   State<MessageScreen> createState() => _MessageScreenState();
// }
//
// class _MessageScreenState extends State<MessageScreen> {
//
//   List<ChatUserListModel> list = [
//     ChatUserListModel(
//       name: 'Chintan',
//       message: 'Hello',
//       createdAt: '2:30 PM',
//     ),
//     ChatUserListModel(
//       name: 'Hiren',
//       message: 'Hi',
//       createdAt: '4:30 PM',
//     ),ChatUserListModel(
//       name: 'Akshay',
//       message: 'Good Morning',
//       createdAt: '8:30 AM',
//     ),
//     ChatUserListModel(
//       name: 'Mihir',
//       message: 'Good Night',
//       createdAt: '8:30 PM',
//     ),ChatUserListModel(
//       name: 'Krupa',
//       message: 'Thank You',
//       createdAt: '2:30 PM',
//     ),ChatUserListModel(
//       name: 'Hemant',
//       message: 'Are you there?',
//       createdAt: '2:30 AM',
//     ),ChatUserListModel(
//       name: 'Ankit',
//       message: 'let\'s go',
//       createdAt: '2:30 PM',
//     ),ChatUserListModel(
//       name: 'Kishan',
//       message: 'Please call me',
//       createdAt: '5:00 PM',
//     ),ChatUserListModel(
//       name: 'Meet',
//       message: 'Reply me',
//       createdAt: '2:20 AM',
//     ),ChatUserListModel(
//       name: 'Piyush',
//       message: 'Do you have time?',
//       createdAt: '6:30 AM',
//     )
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 15.w,
//               width: double.infinity,
//               color: AppColor.primaryColor,
//               child: Center(
//                 child: Text(
//                   'Message',
//                   style: AppFonts.boldTextStyle(
//                       fontSize: 20.0, color: AppColor.white),
//                 ),
//               ),
//             ),
//             Expanded(
//                 child: Container(
//               color: AppColor.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView.builder(
//                   itemCount: list.length,
//                     itemBuilder: (context, index) {
//                     var data = list[index];
//                  return  InkWell(
//                    onTap: (){
//                      Get.to(() => ChatScreen(user: data));
//                    },
//                    child: Card(
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                          child: Row(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            children: [
//                               CircleAvatar(
//                                 radius: 20,
//                                 backgroundColor: AppColor.grey,
//                                 child: Icon(Icons.person),
//                               ),
//                              Expanded(
//                                child: Column(
//                                  children: [
//                                    ListTile(
//                                      title: Text(data.name?? "",
//                                          style: AppFonts.boldTextStyle(
//                                              fontSize: 15.0, color: AppColor.black)),
//                                      subtitle: Text(data.message?? "",
//                                          style: AppFonts.regularTextStyle(
//                                              fontSize: 12.0, color: AppColor.black)),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              Text(data.createdAt?? "",
//                                  style: AppFonts.boldTextStyle(
//                                      fontSize: 15.0, color: AppColor.black))
//                            ],
//                          ),
//                        )),
//                  );
//                 }),
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// class ContactListScreen extends StatelessWidget {
//   final List<Map<String, String>> contacts = [
//     {"name": "Aaaaa", "initial": "A"},
//     {"name": "Aakil Clg", "image": "assets/images/call.png"},
//     {"name": "Aaliya Chicken", "initial": "A"},
//     {"name": "Aamir Anaval", "initial": "A"},
//     {"name": "Aanand Clg", "image": "assets/images/call.png"},
//     {"name": "Ab", "initial": "A"},
//     {"name": "Abhi Kodivad", "image": "assets/images/call.png"},
//     {"name": "Abhishek Clg", "initial": "A"},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Contacts')),
//       body: ListView.builder(
//         itemCount: contacts.length,
//         itemBuilder: (context, index) {
//           var contact = contacts[index];
//           return ListTile(
//             leading: contact.containsKey('image')
//                 ? CircleAvatar(
//               backgroundImage: AssetImage(contact['image']!),
//             )
//                 : CircleAvatar(
//               child: Text(contact['initial']!),
//             ),
//             title: Text(contact['name']!),
//           );
//      import 'package:contacts_service/contacts_service.dart';
  // },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:

//         child: const Icon(Icons.add),
//       ),
//
//     );

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

import 'contact_details_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
    );
  }
}
class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}
class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];
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
      contacts = phoneContacts.toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Contacts'),
        actions: [
          IconButton(onPressed: _loadContacts, icon: const Icon(Icons.refresh)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: contacts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          var contact = contacts[index];
          // Extract all phone numbers for the contact
          List<String> phoneNumbers = contact.phones!
              .map((phone) => phone.value ?? "No Number")
              .toList();
          return InkWell(onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ContatctDetailsScreen(
                  userName: contact.displayName ?? "No Name",
                  phoneNumbers: contact.phones?.map((phone) => phone.value ?? "").toList() ?? [],
                ),
              ),
            );
          },
            child: ListTile(
              leading: CircleAvatar(
                child: Text(contact.initials()),
              ),
              title: Text(contact.displayName ?? 'No Name'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: phoneNumbers
                    .map((number) => Text(number, style: const TextStyle(color: Colors.grey)))
                    .toList(),
              ),
            ),
          );
        },
      ),

    );
  }
}














