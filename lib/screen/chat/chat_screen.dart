import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../model/chat_user_list_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font.dart';

class ChatScreen extends StatefulWidget {
  final ChatUserListModel user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ImagePicker _picker = ImagePicker();
  final ScrollController _scrollController = ScrollController();
  void _sendMessage(String type, dynamic content) {
    setState(() {
      _messages.add({
        'type': type,
        'content': content,
        'isSent': true,
        'time': TimeOfDay.now().format(context),
      });
    });
  }

  void _sendTextMessage() {
    if (_controller.text.isNotEmpty) {
      _sendMessage('text', _controller.text);
      _controller.clear();
      _scrollToBottom();
    }
  }

  Future<void> _sendImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _sendMessage('image', image.path);
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
  Future<void> _sendFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _sendMessage('file', result.files.single.path);
      _scrollToBottom();
    }
  }

  Future<void> _sendVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _sendMessage('video', video.path);
      _scrollToBottom();
    }
  }

  void _sendEmoji(String emoji) {
    _sendMessage('emoji', emoji);
    _scrollToBottom();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messages.add({
      'type': 'text',
      'content': widget.user.message,
      'isSent': false,
      'time': widget.user.createdAt,
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.primaryColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 15.w,
              width: double.infinity,
              color: AppColor.primaryColor,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColor.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Center(
                    child: Text(
                        widget.user.name ?? 'Chat',
                      style: AppFonts.boldTextStyle(
                          fontSize: 20.0, color: AppColor.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  var message = _messages[index];
                  Widget messageWidget;
                  switch (message['type']) {
                    case 'text':
                      messageWidget = Text(
                        message['content'],
                        style: AppFonts.regularTextStyle(
                            fontSize: 12.0, color: AppColor.white),
                      );
                      break;
                    case 'image':
                      messageWidget = Container(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(File(message['content']), fit: BoxFit.cover)));
                      break;
                    case 'file':
                      messageWidget = Text(
                        'File: ${message['content']}',
                        style: AppFonts.regularTextStyle(
                            fontSize: 12.0, color: AppColor.white),
                      );
                      break;
                    case 'video':
                      messageWidget = Container(
                          height: 160,
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: VideoPlayerWidget(videoPath: message['content'])));
                      break;
                    case 'emoji':
                      messageWidget = Text(
                        message['content'],
                        style: TextStyle(fontSize: 24),
                      );
                      break;
                    default:
                      messageWidget = Container();
                  }

                  return Align(
                    alignment: message['isSent']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Card(
                      color: message['isSent']
                          ? AppColor.primaryColor
                          : AppColor.black.withOpacity(0.7),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: message['isSent']
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            messageWidget,
                            SizedBox(height: 4),
                            Text(
                              message['time'],
                              style: AppFonts.regularTextStyle(
                                  fontSize: 10.0, color: AppColor.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        border: Border.all(color: AppColor.primaryColor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width:8),
                          InkWell(
                            onTap: () => _sendEmoji('😊'),
                            child: Icon(Icons.emoji_emotions, color: AppColor.grey,size: 5.w),
                          ),
                          SizedBox(width:4),
                          Expanded(
                            child: Container(
                              child: TextField(
                                controller: _controller,
                                style: AppFonts.regularTextStyle(
                                    fontSize: 4.w, color: AppColor.white),
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type a message',
                                  hintStyle: AppFonts.regularTextStyle(
                                      fontSize: 14.0, color: AppColor.grey),
                                ),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: _sendFile,
                            child: Icon(Icons.attach_file, color: AppColor.grey,size: 5.w),
                          ),
                          SizedBox(width:6),
                          InkWell(
                            onTap: _sendImage,
                            child: Icon(Icons.image, color: AppColor.grey,size: 5.w),
                          ),
                          SizedBox(width:6),
                          InkWell(
                            onTap: _sendVideo,
                            child: Icon(Icons.videocam, color: AppColor.grey,size: 5.w),
                          ),
                          SizedBox(width:8),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  InkWell(
                    child: Container(
                      height: 13.w,
                      width: 13.w,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.send, color: AppColor.grey)),
                    onTap: _sendTextMessage,
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({super.key, required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Container(
        height: 100,
          width: 100,
          child: VideoPlayer(_controller)),
    )
        : Container();
  }
}