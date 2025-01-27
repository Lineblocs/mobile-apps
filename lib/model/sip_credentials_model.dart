import 'dart:convert';

GetSipCredentialsModel getSipCredentialsModelFromJson(String str) => GetSipCredentialsModel.fromJson(json.decode(str));

String getSipCredentialsModelToJson(GetSipCredentialsModel data) => json.encode(data.toJson());

class GetSipCredentialsModel {
  String? username;
  String? secret;
  String? host;
  String? port;
  String? websocketEndpoint;
  String? displayName;
  String? sipUri;

  GetSipCredentialsModel({
    this.username,
    this.secret,
    this.host,
    this.port,
    this.websocketEndpoint,
    this.displayName,
    this.sipUri,
  });

  factory GetSipCredentialsModel.fromJson(Map<String, dynamic> json) => GetSipCredentialsModel(
    username: json["username"],
    secret: json["secret"],
    host: json["host"],
    port: json["port"],
    websocketEndpoint: json["websocket_endpoint"],
    displayName: json["display_name"],
    sipUri: json["sip_uri"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "secret": secret,
    "host": host,
    "port": port,
    "websocket_endpoint": websocketEndpoint,
    "display_name": displayName,
    "sip_uri": sipUri,
  };
}
