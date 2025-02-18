import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proximity_screen_lock/proximity_screen_lock.dart';
import 'package:sip_ua/sip_ua.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import '../controller/dashboard_controller.dart';
import '../controller/theme_controller.dart';
import '../model/call_history_model.dart';
import '../service/show_app_message.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import '../utils/app_string.dart';
import '../widget/comman_widget.dart';
import 'callscreen.dart';
import 'contact_details_screen.dart';

class CallHistoryDetailsScreen extends StatefulWidget {

  final SIPUAHelper? helper;
  CallHistoryDetailsScreen({super.key, required this.callHistory,this.helper});

  CallHistory callHistory;

  @override
  State<CallHistoryDetailsScreen> createState() =>
      _CallHistoryDetailsScreenState();
}

class _CallHistoryDetailsScreenState extends State<CallHistoryDetailsScreen>  implements SipUaHelperListener {
  final noteController = TextEditingController();
  DashboardController controller = Get.find();
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration _totalDuration = Duration.zero;
  Duration _currentDuration = Duration.zero;
  bool isPlaying = false;
  SIPUAHelper? get helper => widget.helper;
  late RegistrationState _registerState;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteController.text = widget.callHistory.notes ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCallRecording(widget.callHistory.apiId ?? "");
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
    _registerState = helper!.registerState;
    helper!.addSipUaHelperListener(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getGetSipCredentials(context).then((value) {
        handleSave(context);
      });
    });
  }


  void handleSave(BuildContext context) {
    if (controller.sipCredentials.value.websocketEndpoint == '') {

    } else if (controller.sipCredentials.value.sipUri == '') {

    }
    UaSettings settings = UaSettings();

    settings.port = controller.sipCredentials.value.port;
    settings.webSocketSettings.extraHeaders = {
      'Origin': 'https:// ${Uri.parse(controller.sipCredentials.value.websocketEndpoint?? "").host}',
      'Host': Uri.parse(controller.sipCredentials.value.websocketEndpoint?? "").host
    };
    settings.webSocketSettings.allowBadCertificate = true;
    print('AllowBadCertificate: ${settings.webSocketSettings.allowBadCertificate}');
    settings.webSocketSettings.userAgent = 'Dart/2.8 (dart:io) for OpenSIPS.';
    settings.tcpSocketSettings.allowBadCertificate = true;
    settings.transportType = TransportType.WS;
    print('TransportType: ${settings.transportType}');
    settings.uri = controller.sipCredentials.value.sipUri;
    print('URI: ${settings.uri}');
    settings.webSocketUrl = controller.sipCredentials.value.websocketEndpoint;
    print('WebSocketUrl: ${settings.webSocketUrl}');
    settings.host = controller.sipCredentials.value.host;
    print('Host: ${settings.host}');
    settings.authorizationUser = controller.sipCredentials.value.username;
    print('AuthorizationUser: ${settings.authorizationUser}');
    settings.password = controller.sipCredentials.value.secret;
    print('Password: ${settings.password}');
    settings.displayName = controller.sipCredentials.value.displayName;
    print('DisplayName: ${settings.displayName}');
    settings.userAgent = 'Dart SIP Client v1.0.0';
    print('UserAgent: ${settings.userAgent}');
    settings.dtmfMode = DtmfMode.RFC2833;
    print('DtmfMode: ${settings.dtmfMode}');
    settings.contact_uri = 'sip:${settings.authorizationUser}@${settings.host}';
    print('ContactUri: ${settings.contact_uri}');
    helper!.start(settings);
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
            AppString().strCallHistoryDetails,
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
                          InkWell(
                            onTap: () {
                             _handleCall(context, true);
                            },
                            child: actionButton(
                                Icons.call, AppString().strCall, AppColor.green),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            AppString().strStatus,
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
                    Obx(() {
                      return controller.callHistoryDetails.value.recordings
                                  ?.isNotEmpty ??
                              false
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller
                                  .callHistoryDetails.value.recordings!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                toggleAudio(controller
                                                        .callHistoryDetails
                                                        .value
                                                        .recordings?[index]
                                                        .s3Url ??
                                                    "");
                                              },
                                              child: Icon(
                                                isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                color: themeController
                                                        .isDarkMode.value
                                                    ? AppColor.white
                                                    : AppColor.primaryColor,
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Slider(
                                                    activeColor: themeController
                                                            .isDarkMode.value
                                                        ? AppColor.white
                                                        : AppColor.primaryColor,
                                                    value: _currentDuration
                                                        .inSeconds
                                                        .toDouble(),
                                                    max: _totalDuration
                                                        .inSeconds
                                                        .toDouble(),
                                                    onChanged: (double value) {
                                                      setState(() {
                                                        audioPlayer.seek(
                                                            Duration(
                                                                seconds: value
                                                                    .toInt()));
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _currentDuration
                                                    .toString()
                                                    .split('.')
                                                    .first,
                                                style:
                                                    AppFonts.regularTextStyle(
                                                        fontSize: 8.sp,
                                                        color: themeController
                                                                .isDarkMode
                                                                .value
                                                            ? AppColor.white
                                                            : AppColor
                                                                .primaryColor),
                                              ),
                                              Text(
                                                _totalDuration
                                                    .toString()
                                                    .split('.')
                                                    .first,
                                                style:
                                                    AppFonts.regularTextStyle(
                                                        fontSize: 8.sp,
                                                        color: themeController
                                                                .isDarkMode
                                                                .value
                                                            ? AppColor.white
                                                            : AppColor
                                                                .primaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : Container();
                    }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: addressTextField(
                          iconColor: themeController.isDarkMode.value
                              ? AppColor.white
                              : AppColor.primaryColor,
                          textColor: themeController.isDarkMode.value
                              ? AppColor.white
                              : AppColor.primaryColor,
                          controller: noteController,
                          maxLines: 10,
                          label: AppString().strNote,
                          icon: Icons.note_add),
                    ),
                    SizedBox(height: 5.w),
                    InkWell(
                      onTap: () {
                        widget.callHistory.notes = noteController.text;
                        controller.putNote(widget.callHistory.apiId ?? "",
                            noteController.text);
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
                            AppString().strSave,
                            style: AppFonts.boldTextStyle(
                                fontSize: 5.w, color: AppColor.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.w),
                  ],
                ),
                Obx(() =>
                    controller.isLoading.value ? commonLoading() : SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget?> _handleCall(BuildContext context,
      [bool voiceOnly = false]) async {
    print('Starting call ${widget.callHistory.callFrom}');
    final dest = widget.callHistory.callFrom;
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await Permission.microphone.request();
      await Permission.camera.request();
    }

    var mediaConstraints = <String, dynamic>{
      'audio': true,
      'video': {
        'mandatory': <String, dynamic>{
          'minWidth': '640',
          'minHeight': '480',
          'minFrameRate': '30',
        },
        'facingMode': 'user',
      }
    };

    webrtc.MediaStream mediaStream;

    try {
      mediaStream =
      await webrtc.navigator.mediaDevices.getUserMedia(mediaConstraints);
    } catch (e) {
      print('getUserMedia() failed: $e');
      return null;
    }

    // Add logging to track the call status
    print('Starting call with destination: $dest');
    helper!
        .call(dest!, voiceOnly: voiceOnly, mediaStream: mediaStream)
        .then((_) {
      print('Call started successfully');
      mediaStream.getAudioTracks().forEach((track) {
        track.onEnded = () {
          print('Audio track ended');
        };
      });
    }).catchError((error) {
      print('Call failed: $error');
    });

    // Ensure the MediaStream is not being closed or garbage collected
    // _keepMediaStreamAlive(mediaStream);
    ProximityScreenLock.setActive(true);
    // _preferences.setString('dest', dest);
    return null;
  }

  @override
  void callStateChanged(Call call, CallState state) {
    print('Call state changed to: ${state.state}');
    if (state.state == CallStateEnum.CALL_INITIATION) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreenWidget(helper!, call),
        ),
      );
    }
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    // TODO: implement onNewMessage
  }

  @override
  void onNewNotify(Notify ntf) {
    // TODO: implement onNewNotify
  }

  @override
  void onNewReinvite(ReInvite event) {
    // TODO: implement onNewReinvite
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    print('Registration state changed to: ${state.state}');
    setState(() {
      _registerState = state;
    });
  }

  @override
  void transportStateChanged(TransportState state) {
    // TODO: implement transportStateChanged
  }


  @override
  deactivate() {
    super.deactivate();
    // textController.text;
    helper!.removeSipUaHelperListener(this);

  }
}
