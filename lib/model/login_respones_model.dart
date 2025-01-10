import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  Token? token;
  Workspace? workspace;
  bool? enable2Fa;
  bool? isAdmin;
  String? adminWorkspaceToken;

  LoginResponseModel({
    this.token,
    this.workspace,
    this.enable2Fa,
    this.isAdmin,
    this.adminWorkspaceToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    token: json["token"] == null ? null : Token.fromJson(json["token"]),
    workspace: json["workspace"] == null ? null : Workspace.fromJson(json["workspace"]),
    enable2Fa: json["enable_2fa"],
    isAdmin: json["isAdmin"],
    adminWorkspaceToken: json["adminWorkspaceToken"],
  );

  Map<String, dynamic> toJson() => {
    "token": token?.toJson(),
    "workspace": workspace?.toJson(),
    "enable_2fa": enable2Fa,
    "isAdmin": isAdmin,
    "adminWorkspaceToken": adminWorkspaceToken,
  };
}

class Token {
  String? auth;
  DateTime? expireIn;
  int? expireInTimestamp;

  Token({
    this.auth,
    this.expireIn,
    this.expireInTimestamp,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    auth: json["auth"],
    expireIn: json["expire_in"] == null ? null : DateTime.parse(json["expire_in"]),
    expireInTimestamp: json["expire_in_timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "auth": auth,
    "expire_in": expireIn?.toIso8601String(),
    "expire_in_timestamp": expireInTimestamp,
  };
}

class Workspace {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  int? creatorId;
  String? apiToken;
  String? apiSecret;
  bool? byoEnabled;
  dynamic outboundMacroId;
  int? ipWhitelistDisabled;
  String? plan;
  int? trialMode;
  String? freeTrialStarted;
  dynamic flowId;
  String? defaultRegion;
  String? planTerm;
  int? externalAppWorkspace;
  dynamic billingCountryId;
  dynamic billingRegionId;
  String? accountNo;
  int? active;
  int? sentSatisfactionSurvey;
  dynamic defaultRegionId;
  dynamic defaultRouterId;
  String? domain;
  UserInfo? userInfo;

  Workspace({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.creatorId,
    this.apiToken,
    this.apiSecret,
    this.byoEnabled,
    this.outboundMacroId,
    this.ipWhitelistDisabled,
    this.plan,
    this.trialMode,
    this.freeTrialStarted,
    this.flowId,
    this.defaultRegion,
    this.planTerm,
    this.externalAppWorkspace,
    this.billingCountryId,
    this.billingRegionId,
    this.accountNo,
    this.active,
    this.sentSatisfactionSurvey,
    this.defaultRegionId,
    this.defaultRouterId,
    this.domain,
    this.userInfo,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    name: json["name"],
    creatorId: json["creator_id"],
    apiToken: json["api_token"],
    apiSecret: json["api_secret"],
    byoEnabled: json["byo_enabled"],
    outboundMacroId: json["outbound_macro_id"],
    ipWhitelistDisabled: json["ip_whitelist_disabled"],
    plan: json["plan"],
    trialMode: json["trial_mode"],
    freeTrialStarted: json["free_trial_started"],
    flowId: json["flow_id"],
    defaultRegion: json["default_region"],
    planTerm: json["plan_term"],
    externalAppWorkspace: json["external_app_workspace"],
    billingCountryId: json["billing_country_id"],
    billingRegionId: json["billing_region_id"],
    accountNo: json["account_no"],
    active: json["active"],
    sentSatisfactionSurvey: json["sent_satisfaction_survey"],
    defaultRegionId: json["default_region_id"],
    defaultRouterId: json["default_router_id"],
    domain: json["domain"],
    userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "name": name,
    "creator_id": creatorId,
    "api_token": apiToken,
    "api_secret": apiSecret,
    "byo_enabled": byoEnabled,
    "outbound_macro_id": outboundMacroId,
    "ip_whitelist_disabled": ipWhitelistDisabled,
    "plan": plan,
    "trial_mode": trialMode,
    "free_trial_started": freeTrialStarted,
    "flow_id": flowId,
    "default_region": defaultRegion,
    "plan_term": planTerm,
    "external_app_workspace": externalAppWorkspace,
    "billing_country_id": billingCountryId,
    "billing_region_id": billingRegionId,
    "account_no": accountNo,
    "active": active,
    "sent_satisfaction_survey": sentSatisfactionSurvey,
    "default_region_id": defaultRegionId,
    "default_router_id": defaultRouterId,
    "domain": domain,
    "user_info": userInfo?.toJson(),
  };
}

class UserInfo {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? workspaceId;
  int? userId;
  bool? manageUsers;
  bool? manageExtensions;
  bool? createExtension;
  bool? manageBilling;
  bool? manageWorkspace;
  bool? manageDids;
  bool? createDid;
  bool? manageCalls;
  bool? manageRecordings;
  bool? manageBlockedNumbers;
  bool? manageIpWhitelist;
  bool? manageVerifiedCallerIds;
  bool? createFlow;
  bool? manageFlows;
  String? publicId;
  bool? manageFunctions;
  bool? createFunction;
  bool? manageParams;
  bool? manageExtensionCodes;
  bool? managePorts;
  bool? managePhones;
  bool? createPhone;
  bool? managePhonegroups;
  bool? createPhonegroup;
  bool? createPhoneglobalsetting;
  bool? managePhoneglobalsettings;
  bool? createPhoneindividualsetting;
  bool? managePhoneindividualsettings;
  String? hash;
  int? verified;
  int? accepted;
  int? hashExpired;
  bool? manageByoCarriers;
  bool? createByoCarrier;
  bool? manageByoDidNumbers;
  bool? createByoDidNumber;
  dynamic extensionId;
  dynamic numberId;
  String? preferredPop;
  bool? createTrunks;
  bool? manageTrunks;
  dynamic joinedAt;
  dynamic assignedToId;
  dynamic assignedRoleId;

  UserInfo({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.workspaceId,
    this.userId,
    this.manageUsers,
    this.manageExtensions,
    this.createExtension,
    this.manageBilling,
    this.manageWorkspace,
    this.manageDids,
    this.createDid,
    this.manageCalls,
    this.manageRecordings,
    this.manageBlockedNumbers,
    this.manageIpWhitelist,
    this.manageVerifiedCallerIds,
    this.createFlow,
    this.manageFlows,
    this.publicId,
    this.manageFunctions,
    this.createFunction,
    this.manageParams,
    this.manageExtensionCodes,
    this.managePorts,
    this.managePhones,
    this.createPhone,
    this.managePhonegroups,
    this.createPhonegroup,
    this.createPhoneglobalsetting,
    this.managePhoneglobalsettings,
    this.createPhoneindividualsetting,
    this.managePhoneindividualsettings,
    this.hash,
    this.verified,
    this.accepted,
    this.hashExpired,
    this.manageByoCarriers,
    this.createByoCarrier,
    this.manageByoDidNumbers,
    this.createByoDidNumber,
    this.extensionId,
    this.numberId,
    this.preferredPop,
    this.createTrunks,
    this.manageTrunks,
    this.joinedAt,
    this.assignedToId,
    this.assignedRoleId,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    workspaceId: json["workspace_id"],
    userId: json["user_id"],
    manageUsers: json["manage_users"],
    manageExtensions: json["manage_extensions"],
    createExtension: json["create_extension"],
    manageBilling: json["manage_billing"],
    manageWorkspace: json["manage_workspace"],
    manageDids: json["manage_dids"],
    createDid: json["create_did"],
    manageCalls: json["manage_calls"],
    manageRecordings: json["manage_recordings"],
    manageBlockedNumbers: json["manage_blocked_numbers"],
    manageIpWhitelist: json["manage_ip_whitelist"],
    manageVerifiedCallerIds: json["manage_verified_caller_ids"],
    createFlow: json["create_flow"],
    manageFlows: json["manage_flows"],
    publicId: json["public_id"],
    manageFunctions: json["manage_functions"],
    createFunction: json["create_function"],
    manageParams: json["manage_params"],
    manageExtensionCodes: json["manage_extension_codes"],
    managePorts: json["manage_ports"],
    managePhones: json["manage_phones"],
    createPhone: json["create_phone"],
    managePhonegroups: json["manage_phonegroups"],
    createPhonegroup: json["create_phonegroup"],
    createPhoneglobalsetting: json["create_phoneglobalsetting"],
    managePhoneglobalsettings: json["manage_phoneglobalsettings"],
    createPhoneindividualsetting: json["create_phoneindividualsetting"],
    managePhoneindividualsettings: json["manage_phoneindividualsettings"],
    hash: json["hash"],
    verified: json["verified"],
    accepted: json["accepted"],
    hashExpired: json["hash_expired"],
    manageByoCarriers: json["manage_byo_carriers"],
    createByoCarrier: json["create_byo_carrier"],
    manageByoDidNumbers: json["manage_byo_did_numbers"],
    createByoDidNumber: json["create_byo_did_number"],
    extensionId: json["extension_id"],
    numberId: json["number_id"],
    preferredPop: json["preferred_pop"],
    createTrunks: json["create_trunks"],
    manageTrunks: json["manage_trunks"],
    joinedAt: json["joined_at"],
    assignedToId: json["assigned_to_id"],
    assignedRoleId: json["assigned_role_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "workspace_id": workspaceId,
    "user_id": userId,
    "manage_users": manageUsers,
    "manage_extensions": manageExtensions,
    "create_extension": createExtension,
    "manage_billing": manageBilling,
    "manage_workspace": manageWorkspace,
    "manage_dids": manageDids,
    "create_did": createDid,
    "manage_calls": manageCalls,
    "manage_recordings": manageRecordings,
    "manage_blocked_numbers": manageBlockedNumbers,
    "manage_ip_whitelist": manageIpWhitelist,
    "manage_verified_caller_ids": manageVerifiedCallerIds,
    "create_flow": createFlow,
    "manage_flows": manageFlows,
    "public_id": publicId,
    "manage_functions": manageFunctions,
    "create_function": createFunction,
    "manage_params": manageParams,
    "manage_extension_codes": manageExtensionCodes,
    "manage_ports": managePorts,
    "manage_phones": managePhones,
    "create_phone": createPhone,
    "manage_phonegroups": managePhonegroups,
    "create_phonegroup": createPhonegroup,
    "create_phoneglobalsetting": createPhoneglobalsetting,
    "manage_phoneglobalsettings": managePhoneglobalsettings,
    "create_phoneindividualsetting": createPhoneindividualsetting,
    "manage_phoneindividualsettings": managePhoneindividualsettings,
    "hash": hash,
    "verified": verified,
    "accepted": accepted,
    "hash_expired": hashExpired,
    "manage_byo_carriers": manageByoCarriers,
    "create_byo_carrier": createByoCarrier,
    "manage_byo_did_numbers": manageByoDidNumbers,
    "create_byo_did_number": createByoDidNumber,
    "extension_id": extensionId,
    "number_id": numberId,
    "preferred_pop": preferredPop,
    "create_trunks": createTrunks,
    "manage_trunks": manageTrunks,
    "joined_at": joinedAt,
    "assigned_to_id": assignedToId,
    "assigned_role_id": assignedRoleId,
  };
}
