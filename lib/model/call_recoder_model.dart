import 'dart:convert';

CallRecoderModel callRecoderModelFromJson(String str) => CallRecoderModel.fromJson(json.decode(str));

String callRecoderModelToJson(CallRecoderModel data) => json.encode(data.toJson());

class CallRecoderModel {
  int? id;
  String? apiId;
  String? from;
  String? to;
  String? status;
  String? direction;
  int? duration;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  DateTime? startedAt;
  DateTime? endedAt;
  int? workspaceId;
  String? notes;
  String? planSnapshot;
  String? channelId;
  int? billed;
  dynamic providerId;
  String? sipCallId;
  dynamic sipStatus;
  dynamic fromExtensionId;
  dynamic toExtensionId;
  int? durationLive;
  String? durationLiveHuman;
  int? durationEnded;
  String? durationEndedHuman;
  List<dynamic>? recordings;

  CallRecoderModel({
    this.id,
    this.apiId,
    this.from,
    this.to,
    this.status,
    this.direction,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.startedAt,
    this.endedAt,
    this.workspaceId,
    this.notes,
    this.planSnapshot,
    this.channelId,
    this.billed,
    this.providerId,
    this.sipCallId,
    this.sipStatus,
    this.fromExtensionId,
    this.toExtensionId,
    this.durationLive,
    this.durationLiveHuman,
    this.durationEnded,
    this.durationEndedHuman,
    this.recordings,
  });

  factory CallRecoderModel.fromJson(Map<String, dynamic> json) => CallRecoderModel(
    id: json["id"],
    apiId: json["api_id"],
    from: json["from"],
    to: json["to"],
    status: json["status"],
    direction: json["direction"],
    duration: json["duration"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    startedAt: json["started_at"] == null ? null : DateTime.parse(json["started_at"]),
    endedAt: json["ended_at"] == null ? null : DateTime.parse(json["ended_at"]),
    workspaceId: json["workspace_id"],
    notes: json["notes"],
    planSnapshot: json["plan_snapshot"],
    channelId: json["channel_id"],
    billed: json["billed"],
    providerId: json["provider_id"],
    sipCallId: json["sip_call_id"],
    sipStatus: json["sip_status"],
    fromExtensionId: json["from_extension_id"],
    toExtensionId: json["to_extension_id"],
    durationLive: json["duration_live"],
    durationLiveHuman: json["duration_live_human"],
    durationEnded: json["duration_ended"],
    durationEndedHuman: json["duration_ended_human"],
    recordings: json["recordings"] == null ? [] : List<dynamic>.from(json["recordings"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "api_id": apiId,
    "from": from,
    "to": to,
    "status": status,
    "direction": direction,
    "duration": duration,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_id": userId,
    "started_at": startedAt?.toIso8601String(),
    "ended_at": endedAt?.toIso8601String(),
    "workspace_id": workspaceId,
    "notes": notes,
    "plan_snapshot": planSnapshot,
    "channel_id": channelId,
    "billed": billed,
    "provider_id": providerId,
    "sip_call_id": sipCallId,
    "sip_status": sipStatus,
    "from_extension_id": fromExtensionId,
    "to_extension_id": toExtensionId,
    "duration_live": durationLive,
    "duration_live_human": durationLiveHuman,
    "duration_ended": durationEnded,
    "duration_ended_human": durationEndedHuman,
    "recordings": recordings == null ? [] : List<dynamic>.from(recordings!.map((x) => x)),
  };
}
