
import 'dart:convert';

CallHistoryModel callHistoryModelFromJson(String str) => CallHistoryModel.fromJson(json.decode(str));

String callHistoryModelToJson(CallHistoryModel data) => json.encode(data.toJson());

class CallHistoryModel {
  List<CallHistory>? data;
  Meta? meta;

  CallHistoryModel({
    this.data,
    this.meta,
  });

  factory CallHistoryModel.fromJson(Map<String, dynamic> json) => CallHistoryModel(
    data: json["data"] == null ? [] : List<CallHistory>.from(json["data"]!.map((x) => CallHistory.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class CallHistory {
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
  String? callFrom;
  String? callTo;
  String? callStatus;
  String? callDirection;
  dynamic tags;
  int? durationLive;
  String? durationLiveHuman;
  int? durationEnded;
  String? durationEndedHuman;
  FriendlyDates? friendlyDates;

  CallHistory({
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
    this.callFrom,
    this.callTo,
    this.callStatus,
    this.callDirection,
    this.tags,
    this.durationLive,
    this.durationLiveHuman,
    this.durationEnded,
    this.durationEndedHuman,
    this.friendlyDates,
  });

  factory CallHistory.fromJson(Map<String, dynamic> json) => CallHistory(
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
    callFrom: json["call_from"],
    callTo: json["call_to"],
    callStatus: json["call_status"],
    callDirection: json["call_direction"],
    tags: json["tags"],
    durationLive: json["duration_live"],
    durationLiveHuman: json["duration_live_human"],
    durationEnded: json["duration_ended"],
    durationEndedHuman: json["duration_ended_human"],
    friendlyDates: json["friendly_dates"] == null ? null : FriendlyDates.fromJson(json["friendly_dates"]),
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
    "call_from": callFrom,
    "call_to": callTo,
    "call_status": callStatus,
    "call_direction": callDirection,
    "tags": tags,
    "duration_live": durationLive,
    "duration_live_human": durationLiveHuman,
    "duration_ended": durationEnded,
    "duration_ended_human": durationEndedHuman,
    "friendly_dates": friendlyDates?.toJson(),
  };
}

class FriendlyDates {
  String? createdAt;
  String? updatedAt;

  FriendlyDates({
    this.createdAt,
    this.updatedAt,
  });

  factory FriendlyDates.fromJson(Map<String, dynamic> json) => FriendlyDates(
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
    "links": links?.toJson(),
  };
}

class Links {
  String? next;

  Links({
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
  };
}

