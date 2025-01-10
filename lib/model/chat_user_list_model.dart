class ChatUserListModel{
  String? id;
  String? name;
  String? message;
  String? email;
  String? profilePic;
  String? status;
  String? token;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;

  ChatUserListModel({
    this.id,
    this.name,
    this.message,
    this.email,
    this.profilePic,
    this.status,
    this.token,
    this.fcmToken,
    this.createdAt,
    this.updatedAt
  });

  factory ChatUserListModel.fromJson(Map<String, dynamic> json){
    return ChatUserListModel(
      id: json['id'],
      name: json['name'], message: json['message'],
      email: json['email'],
      profilePic: json['profile_pic'],
      status: json['status'],
      token: json['token'],
      fcmToken: json['fcm_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']
    );
  }
}