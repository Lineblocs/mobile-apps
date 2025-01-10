
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? confirmationCode;
  bool? confirmed;
  bool? admin;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? firstName;
  String? lastName;
  String? stripeId;
  String? containerName;
  String? ipAddress;
  String? domain;
  String? sipPort;
  String? rtpPorts;
  int? trialMode;
  String? plan;
  bool? autoRecharge;
  int? autoRechargeTopUp;
  String? callCode;
  String? mobileNumber;
  dynamic reservedIp;
  String? networkDevice;
  dynamic reservedPrivateIp;
  dynamic ipPrivate;
  String? region;
  bool? invoicesByEmail;
  String? billingPackage;
  DateTime? lastLogin;
  String? emailVerifyHash;
  int? emailVerified;
  dynamic lastLoginReminded;
  bool? ipWhitelistDisabled;
  String? addressLine1;
  String? addressLine2;
  String? postalCode;
  String? state;
  String? city;
  String? country;
  int? linkedPaypal;
  List<dynamic>? freeTrialStarted;
  int? freeTrialReminderSent;
  String? officeNumber;
  String? jobTitle;
  int? needsPasswordSet;
  String? needsSetPasswordDate;
  String? pendingNumber;
  String? the2FaType;
  String? secretCode;
  String? recoveryCode;
  int? the2FaEnabled;
  bool? enable2Fa;
  String? typeOf2Fa;
  String? secretCode2Fa;
  String? recoveryCode2Fa;
  String? theme;
  int? externalAppUser;
  dynamic companyName;
  dynamic taxNumber;
  bool? autoSaveFlows;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.confirmationCode,
    this.confirmed,
    this.admin,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.firstName,
    this.lastName,
    this.stripeId,
    this.containerName,
    this.ipAddress,
    this.domain,
    this.sipPort,
    this.rtpPorts,
    this.trialMode,
    this.plan,
    this.autoRecharge,
    this.autoRechargeTopUp,
    this.callCode,
    this.mobileNumber,
    this.reservedIp,
    this.networkDevice,
    this.reservedPrivateIp,
    this.ipPrivate,
    this.region,
    this.invoicesByEmail,
    this.billingPackage,
    this.lastLogin,
    this.emailVerifyHash,
    this.emailVerified,
    this.lastLoginReminded,
    this.ipWhitelistDisabled,
    this.addressLine1,
    this.addressLine2,
    this.postalCode,
    this.state,
    this.city,
    this.country,
    this.linkedPaypal,
    this.freeTrialStarted,
    this.freeTrialReminderSent,
    this.officeNumber,
    this.jobTitle,
    this.needsPasswordSet,
    this.needsSetPasswordDate,
    this.pendingNumber,
    this.the2FaType,
    this.secretCode,
    this.recoveryCode,
    this.the2FaEnabled,
    this.enable2Fa,
    this.typeOf2Fa,
    this.secretCode2Fa,
    this.recoveryCode2Fa,
    this.theme,
    this.externalAppUser,
    this.companyName,
    this.taxNumber,
    this.autoSaveFlows,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    confirmationCode: json["confirmation_code"],
    confirmed: json["confirmed"],
    admin: json["admin"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    stripeId: json["stripe_id"],
    containerName: json["container_name"],
    ipAddress: json["ip_address"],
    domain: json["domain"],
    sipPort: json["sip_port"],
    rtpPorts: json["rtp_ports"],
    trialMode: json["trial_mode"],
    plan: json["plan"],
    autoRecharge: json["auto_recharge"],
    autoRechargeTopUp: json["auto_recharge_top_up"],
    callCode: json["call_code"],
    mobileNumber: json["mobile_number"],
    reservedIp: json["reserved_ip"],
    networkDevice: json["network_device"],
    reservedPrivateIp: json["reserved_private_ip"],
    ipPrivate: json["ip_private"],
    region: json["region"],
    invoicesByEmail: json["invoices_by_email"],
    billingPackage: json["billing_package"],
    lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
    emailVerifyHash: json["email_verify_hash"],
    emailVerified: json["email_verified"],
    lastLoginReminded: json["last_login_reminded"],
    ipWhitelistDisabled: json["ip_whitelist_disabled"],
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    postalCode: json["postal_code"],
    state: json["state"],
    city: json["city"],
    country: json["country"],
    linkedPaypal: json["linked_paypal"],
    freeTrialStarted: json["free_trial_started"] == null ? [] : List<dynamic>.from(json["free_trial_started"]!.map((x) => x)),
    freeTrialReminderSent: json["free_trial_reminder_sent"],
    officeNumber: json["office_number"],
    jobTitle: json["job_title"],
    needsPasswordSet: json["needs_password_set"],
    needsSetPasswordDate: json["needs_set_password_date"],
    pendingNumber: json["pending_number"],
    the2FaType: json["2fa_type"],
    secretCode: json["secret_code"],
    recoveryCode: json["recovery_code"],
    the2FaEnabled: json["2fa_enabled"],
    enable2Fa: json["enable_2fa"],
    typeOf2Fa: json["type_of_2fa"],
    secretCode2Fa: json["secret_code_2fa"],
    recoveryCode2Fa: json["recovery_code_2fa"],
    theme: json["theme"],
    externalAppUser: json["external_app_user"],
    companyName: json["company_name"],
    taxNumber: json["tax_number"],
    autoSaveFlows: json["auto_save_flows"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "confirmation_code": confirmationCode,
    "confirmed": confirmed,
    "admin": admin,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "first_name": firstName,
    "last_name": lastName,
    "stripe_id": stripeId,
    "container_name": containerName,
    "ip_address": ipAddress,
    "domain": domain,
    "sip_port": sipPort,
    "rtp_ports": rtpPorts,
    "trial_mode": trialMode,
    "plan": plan,
    "auto_recharge": autoRecharge,
    "auto_recharge_top_up": autoRechargeTopUp,
    "call_code": callCode,
    "mobile_number": mobileNumber,
    "reserved_ip": reservedIp,
    "network_device": networkDevice,
    "reserved_private_ip": reservedPrivateIp,
    "ip_private": ipPrivate,
    "region": region,
    "invoices_by_email": invoicesByEmail,
    "billing_package": billingPackage,
    "last_login": lastLogin?.toIso8601String(),
    "email_verify_hash": emailVerifyHash,
    "email_verified": emailVerified,
    "last_login_reminded": lastLoginReminded,
    "ip_whitelist_disabled": ipWhitelistDisabled,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "postal_code": postalCode,
    "state": state,
    "city": city,
    "country": country,
    "linked_paypal": linkedPaypal,
    "free_trial_started": freeTrialStarted == null ? [] : List<dynamic>.from(freeTrialStarted!.map((x) => x)),
    "free_trial_reminder_sent": freeTrialReminderSent,
    "office_number": officeNumber,
    "job_title": jobTitle,
    "needs_password_set": needsPasswordSet,
    "needs_set_password_date": needsSetPasswordDate,
    "pending_number": pendingNumber,
    "2fa_type": the2FaType,
    "secret_code": secretCode,
    "recovery_code": recoveryCode,
    "2fa_enabled": the2FaEnabled,
    "enable_2fa": enable2Fa,
    "type_of_2fa": typeOf2Fa,
    "secret_code_2fa": secretCode2Fa,
    "recovery_code_2fa": recoveryCode2Fa,
    "theme": theme,
    "external_app_user": externalAppUser,
    "company_name": companyName,
    "tax_number": taxNumber,
    "auto_save_flows": autoSaveFlows,
  };
}
