import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/dashboard_controller.dart';
import '../controller/theme_controller.dart';
import '../model/call_history_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import '../widget/comman_widget.dart';
import 'contact_details_screen.dart';

class CallHistoryDetailsScreen extends StatefulWidget {
  CallHistoryDetailsScreen({super.key, required this.callHistory});

  CallHistory callHistory;

  @override
  State<CallHistoryDetailsScreen> createState() =>
      _CallHistoryDetailsScreenState();
}

class _CallHistoryDetailsScreenState extends State<CallHistoryDetailsScreen> {
  final noteController = TextEditingController();
  DashboardController controller = Get.find();
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration _totalDuration = Duration.zero;
  Duration _currentDuration = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteController.text = widget.callHistory.notes ?? '';
    print("apiId: ${widget.callHistory.apiId}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCallRecoder(widget.callHistory.apiId?? "");
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _totalDuration = duration;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration duration) {
      setState(() {
        _currentDuration = duration;
        if (_currentDuration.inSeconds == _totalDuration.inSeconds) {
          setState(() {
            isPlaying = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> toggleAudio(String url) async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(UrlSource(url));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
          backgroundColor:
              themeController.isDarkMode.value ? null : AppColor.primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'Call History Details',
            style:
                AppFonts.boldTextStyle(fontSize: 20.0, color: AppColor.white),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10.w),
                    CircleAvatar(
                        radius: 50,
                        backgroundColor: themeController.isDarkMode.value
                            ? null
                            : AppColor.primaryColor,
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        )),
                    SizedBox(height: 5.w),
                    Icon(
                      widget.callHistory.direction == "outbound"
                          ? Icons.phone_forwarded
                          : widget.callHistory.direction == "outbound"
                              ? Icons.phone_callback_outlined
                              : Icons.phone_missed,
                      color: themeController.isDarkMode.value
                          ? AppColor.white
                          : AppColor.primaryColor,
                      size: 20,
                    ),
                    SizedBox(height: 5.w),
                    Text(widget.callHistory.callFrom ?? 'No Name',
                        style: AppFonts.boldTextStyle(
                            fontSize: 25.0,
                            color: themeController.isDarkMode.value
                                ? null
                                : AppColor.primaryColor)),
                    SizedBox(height: 5.w),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          actionButton(Icons.call, "Call", AppColor.green),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Status : ",
                            style: AppFonts.boldTextStyle(
                                fontSize: 4.w,
                                color: themeController.isDarkMode.value
                                    ? AppColor.white
                                    : AppColor.primaryColor),
                          ),
                          Text(
                            "${widget.callHistory.status}",
                            style: AppFonts.regularTextStyle(
                                fontSize: 4.w,
                                color: themeController.isDarkMode.value
                                    ? AppColor.white
                                    : AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Icon(
                                //   Icons.mic,
                                //   color: AppColor.primaryColor,
                                // ),
                                // SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    toggleAudio("https://onlinetestcase.com/wp-content/uploads/2023/06/500-KB-MP3.mp3");
                                  },
                                  child: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color:themeController.isDarkMode.value ?  AppColor.white : AppColor.primaryColor,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Slider(
                                        activeColor: themeController.isDarkMode.value ?  AppColor.white : AppColor.primaryColor,
                                        value: _currentDuration.inSeconds.toDouble(),
                                        max: _totalDuration.inSeconds.toDouble(),
                                        onChanged: (double value) {
                                          setState(() {
                                            audioPlayer.seek(Duration(seconds: value.toInt()));
                                          });
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _currentDuration.toString().split('.').first,
                                    style: AppFonts.regularTextStyle(fontSize: 8.sp, color: themeController.isDarkMode.value ?  AppColor.white : AppColor.primaryColor),
                                  ),
                                  Text(
                                    _totalDuration.toString().split('.').first,
                                    style: AppFonts.regularTextStyle(fontSize: 8.sp, color:themeController.isDarkMode.value ?  AppColor.white : AppColor.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: addressTextField(
                          iconColor: themeController.isDarkMode.value ?  AppColor.white : AppColor.primaryColor,
                          textColor: themeController.isDarkMode.value ?  AppColor.white : AppColor.primaryColor,
                          controller: noteController,
                          maxLines: 10,
                          label: 'Note', icon: Icons.note_add),
                    ),
                    SizedBox(height: 5.w),
                    InkWell(
                      onTap: () {
                        widget.callHistory.notes = noteController.text;
                        controller.putNote(
                            widget.callHistory.apiId ?? "", noteController.text);
                        // Get.back(result: widget.callHistory);
                      },
                      child: Container(
                        height: 12.w,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style: AppFonts.boldTextStyle(
                                fontSize: 5.w, color: AppColor.white),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
                Obx(() => controller.isLoading.value ? commonLoading() : SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
