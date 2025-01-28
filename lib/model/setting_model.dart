// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

SettingModel settingModelFromJson(String str) => SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  Customizations? customizations;
  FrontendApiCreds? frontendApiCreds;
  List<AvailableTheme>? availableThemes;

  SettingModel({
    this.customizations,
    this.frontendApiCreds,
    this.availableThemes,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
    customizations: json["customizations"] == null ? null : Customizations.fromJson(json["customizations"]),
    frontendApiCreds: json["frontend_api_creds"] == null ? null : FrontendApiCreds.fromJson(json["frontend_api_creds"]),
    availableThemes: json["available_themes"] == null ? [] : List<AvailableTheme>.from(json["available_themes"]!.map((x) => AvailableTheme.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customizations": customizations?.toJson(),
    "frontend_api_creds": frontendApiCreds?.toJson(),
    "available_themes": availableThemes == null ? [] : List<dynamic>.from(availableThemes!.map((x) => x.toJson())),
  };
}

class AvailableTheme {
  String? name;
  bool? isDefault;

  AvailableTheme({
    this.name,
    this.isDefault,
  });

  factory AvailableTheme.fromJson(Map<String, dynamic> json) => AvailableTheme(
    name: json["name"],
    isDefault: json["is_default"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "is_default": isDefault,
  };
}

class Customizations {
  String? appLogo;
  String? appIcon;
  String? altAppLogo;
  String? adminPortalLogo;
  String? colorScheme;
  String? layoutType;
  String? gridSize;
  String? primaryFont;
  String? secondaryFont;
  String? siteName;
  String? verificationWorkflow;
  String? verificationProvider;
  String? paymentGateway;
  bool? paymentGatewayEnabled;
  bool? customCodeContainersEnabled;
  String? mailProvider;
  String? dnsProvider;
  String? awsRoute53ZoneId;
  String? facebookUrl;
  String? instagramUrl;
  String? twitterUrl;
  String? tiktokUrl;
  String? linkedinUrl;
  String? privacyPolicy;
  String? termsOfService;
  bool? enableGoogleSignin;
  bool? enableMsftSignin;
  bool? enableAppleSignin;
  bool? signupRequiresPaymentDetail;
  String? analyticsSdk;
  bool? billingRetryEnabled;
  String? contactPhoneNumber;
  String? contactAddress;
  String? contactEmail;
  String? smsProvider;
  String? smsApiKey;
  String? smsApiSecret;
  String? maintenanceWindowDay;
  String? maintenanceWindowTime;
  String? smsFromNumber;
  String? blogUrl;
  String? defaultCurrency;
  bool? zendeskEnabled;
  String? opensipsCfg;
  bool? registrationQuestionnaireEnabled;
  String? feedbackPlatform;
  String? trustpilotUrl;
  String? g2Url;
  String? liveChatProvider;
  String? billingFrequency;
  bool? showSavingsContent;
  String? customerSatisfactionSurveyUrl;
  String? defaultRegion;
  bool? liveChatEnabled;
  String? billingNumRetries;
  String? gracePeriodBillingDays;
  bool? registerCreditsEnabled;
  String? registerCredits;
  bool? customerSatisfactionSurveyEnabled;
  bool? portalAnalyticsEnabled;
  bool? recaptchaEnabled;
  bool? disqusEnabled;
  String? token;
  bool? searchIncludePortalViews;
  bool? searchIncludeResources;
  bool? searchIncludeBlogViews;
  bool? automaticModuleUpdates;
  bool? allowAppFeedback;
  String? automaticSecurityUpdates;

  Customizations({
    this.appLogo,
    this.appIcon,
    this.altAppLogo,
    this.adminPortalLogo,
    this.colorScheme,
    this.layoutType,
    this.gridSize,
    this.primaryFont,
    this.secondaryFont,
    this.siteName,
    this.verificationWorkflow,
    this.verificationProvider,
    this.paymentGateway,
    this.paymentGatewayEnabled,
    this.customCodeContainersEnabled,
    this.mailProvider,
    this.dnsProvider,
    this.awsRoute53ZoneId,
    this.facebookUrl,
    this.instagramUrl,
    this.twitterUrl,
    this.tiktokUrl,
    this.linkedinUrl,
    this.privacyPolicy,
    this.termsOfService,
    this.enableGoogleSignin,
    this.enableMsftSignin,
    this.enableAppleSignin,
    this.signupRequiresPaymentDetail,
    this.analyticsSdk,
    this.billingRetryEnabled,
    this.contactPhoneNumber,
    this.contactAddress,
    this.contactEmail,
    this.smsProvider,
    this.smsApiKey,
    this.smsApiSecret,
    this.maintenanceWindowDay,
    this.maintenanceWindowTime,
    this.smsFromNumber,
    this.blogUrl,
    this.defaultCurrency,
    this.zendeskEnabled,
    this.opensipsCfg,
    this.registrationQuestionnaireEnabled,
    this.feedbackPlatform,
    this.trustpilotUrl,
    this.g2Url,
    this.liveChatProvider,
    this.billingFrequency,
    this.showSavingsContent,
    this.customerSatisfactionSurveyUrl,
    this.defaultRegion,
    this.liveChatEnabled,
    this.billingNumRetries,
    this.gracePeriodBillingDays,
    this.registerCreditsEnabled,
    this.registerCredits,
    this.customerSatisfactionSurveyEnabled,
    this.portalAnalyticsEnabled,
    this.recaptchaEnabled,
    this.disqusEnabled,
    this.token,
    this.searchIncludePortalViews,
    this.searchIncludeResources,
    this.searchIncludeBlogViews,
    this.automaticModuleUpdates,
    this.allowAppFeedback,
    this.automaticSecurityUpdates,
  });

  factory Customizations.fromJson(Map<String, dynamic> json) => Customizations(
    appLogo: json["app_logo"],
    appIcon: json["app_icon"],
    altAppLogo: json["alt_app_logo"],
    adminPortalLogo: json["admin_portal_logo"],
    colorScheme: json["color_scheme"],
    layoutType: json["layout_type"],
    gridSize: json["grid_size"],
    primaryFont: json["primary_font"],
    secondaryFont: json["secondary_font"],
    siteName: json["site_name"],
    verificationWorkflow: json["verification_workflow"],
    verificationProvider: json["verification_provider"],
    paymentGateway: json["payment_gateway"],
    paymentGatewayEnabled: json["payment_gateway_enabled"],
    customCodeContainersEnabled: json["custom_code_containers_enabled"],
    mailProvider: json["mail_provider"],
    dnsProvider: json["dns_provider"],
    awsRoute53ZoneId: json["aws_route53_zone_id"],
    facebookUrl: json["facebook_url"],
    instagramUrl: json["instagram_url"],
    twitterUrl: json["twitter_url"],
    tiktokUrl: json["tiktok_url"],
    linkedinUrl: json["linkedin_url"],
    privacyPolicy: json["privacy_policy"],
    termsOfService: json["terms_of_service"],
    enableGoogleSignin: json["enable_google_signin"],
    enableMsftSignin: json["enable_msft_signin"],
    enableAppleSignin: json["enable_apple_signin"],
    signupRequiresPaymentDetail: json["signup_requires_payment_detail"],
    analyticsSdk: json["analytics_sdk"],
    billingRetryEnabled: json["billing_retry_enabled"],
    contactPhoneNumber: json["contact_phone_number"],
    contactAddress: json["contact_address"],
    contactEmail: json["contact_email"],
    smsProvider: json["sms_provider"],
    smsApiKey: json["sms_api_key"],
    smsApiSecret: json["sms_api_secret"],
    maintenanceWindowDay: json["maintenance_window_day"],
    maintenanceWindowTime: json["maintenance_window_time"],
    smsFromNumber: json["sms_from_number"],
    blogUrl: json["blog_url"],
    defaultCurrency: json["default_currency"],
    zendeskEnabled: json["zendesk_enabled"],
    opensipsCfg: json["opensips_cfg"],
    registrationQuestionnaireEnabled: json["registration_questionnaire_enabled"],
    feedbackPlatform: json["feedback_platform"],
    trustpilotUrl: json["trustpilot_url"],
    g2Url: json["g2_url"],
    liveChatProvider: json["live_chat_provider"],
    billingFrequency: json["billing_frequency"],
    showSavingsContent: json["show_savings_content"],
    customerSatisfactionSurveyUrl: json["customer_satisfaction_survey_url"],
    defaultRegion: json["default_region"],
    liveChatEnabled: json["live_chat_enabled"],
    billingNumRetries: json["billing_num_retries"],
    gracePeriodBillingDays: json["grace_period_billing_days"],
    registerCreditsEnabled: json["register_credits_enabled"],
    registerCredits: json["register_credits"],
    customerSatisfactionSurveyEnabled: json["customer_satisfaction_survey_enabled"],
    portalAnalyticsEnabled: json["portal_analytics_enabled"],
    recaptchaEnabled: json["recaptcha_enabled"],
    disqusEnabled: json["disqus_enabled"],
    token: json["_token"],
    searchIncludePortalViews: json["search_include_portal_views"],
    searchIncludeResources: json["search_include_resources"],
    searchIncludeBlogViews: json["search_include_blog_views"],
    automaticModuleUpdates: json["automatic_module_updates"],
    allowAppFeedback: json["allow_app_feedback"],
    automaticSecurityUpdates: json["automatic_security_updates"],
  );

  Map<String, dynamic> toJson() => {
    "app_logo": appLogo,
    "app_icon": appIcon,
    "alt_app_logo": altAppLogo,
    "admin_portal_logo": adminPortalLogo,
    "color_scheme": colorScheme,
    "layout_type": layoutType,
    "grid_size": gridSize,
    "primary_font": primaryFont,
    "secondary_font": secondaryFont,
    "site_name": siteName,
    "verification_workflow": verificationWorkflow,
    "verification_provider": verificationProvider,
    "payment_gateway": paymentGateway,
    "payment_gateway_enabled": paymentGatewayEnabled,
    "custom_code_containers_enabled": customCodeContainersEnabled,
    "mail_provider": mailProvider,
    "dns_provider": dnsProvider,
    "aws_route53_zone_id": awsRoute53ZoneId,
    "facebook_url": facebookUrl,
    "instagram_url": instagramUrl,
    "twitter_url": twitterUrl,
    "tiktok_url": tiktokUrl,
    "linkedin_url": linkedinUrl,
    "privacy_policy": privacyPolicy,
    "terms_of_service": termsOfService,
    "enable_google_signin": enableGoogleSignin,
    "enable_msft_signin": enableMsftSignin,
    "enable_apple_signin": enableAppleSignin,
    "signup_requires_payment_detail": signupRequiresPaymentDetail,
    "analytics_sdk": analyticsSdk,
    "billing_retry_enabled": billingRetryEnabled,
    "contact_phone_number": contactPhoneNumber,
    "contact_address": contactAddress,
    "contact_email": contactEmail,
    "sms_provider": smsProvider,
    "sms_api_key": smsApiKey,
    "sms_api_secret": smsApiSecret,
    "maintenance_window_day": maintenanceWindowDay,
    "maintenance_window_time": maintenanceWindowTime,
    "sms_from_number": smsFromNumber,
    "blog_url": blogUrl,
    "default_currency": defaultCurrency,
    "zendesk_enabled": zendeskEnabled,
    "opensips_cfg": opensipsCfg,
    "registration_questionnaire_enabled": registrationQuestionnaireEnabled,
    "feedback_platform": feedbackPlatform,
    "trustpilot_url": trustpilotUrl,
    "g2_url": g2Url,
    "live_chat_provider": liveChatProvider,
    "billing_frequency": billingFrequency,
    "show_savings_content": showSavingsContent,
    "customer_satisfaction_survey_url": customerSatisfactionSurveyUrl,
    "default_region": defaultRegion,
    "live_chat_enabled": liveChatEnabled,
    "billing_num_retries": billingNumRetries,
    "grace_period_billing_days": gracePeriodBillingDays,
    "register_credits_enabled": registerCreditsEnabled,
    "register_credits": registerCredits,
    "customer_satisfaction_survey_enabled": customerSatisfactionSurveyEnabled,
    "portal_analytics_enabled": portalAnalyticsEnabled,
    "recaptcha_enabled": recaptchaEnabled,
    "disqus_enabled": disqusEnabled,
    "_token": token,
    "search_include_portal_views": searchIncludePortalViews,
    "search_include_resources": searchIncludeResources,
    "search_include_blog_views": searchIncludeBlogViews,
    "automatic_module_updates": automaticModuleUpdates,
    "allow_app_feedback": allowAppFeedback,
    "automatic_security_updates": automaticSecurityUpdates,
  };
}

class FrontendApiCreds {
  String? googleSigninDeveloperKey;
  String? googleSigninClientId;
  String? googleSigninAppId;
  String? msftSigninClientId;
  String? msftSigninClientSecret;
  String? appleSigninClientId;
  String? appleSigninClientSecret;
  String? googleAnalyticsScriptTag;
  String? matomoScriptTag;
  String? stripePubKey;

  FrontendApiCreds({
    this.googleSigninDeveloperKey,
    this.googleSigninClientId,
    this.googleSigninAppId,
    this.msftSigninClientId,
    this.msftSigninClientSecret,
    this.appleSigninClientId,
    this.appleSigninClientSecret,
    this.googleAnalyticsScriptTag,
    this.matomoScriptTag,
    this.stripePubKey,
  });

  factory FrontendApiCreds.fromJson(Map<String, dynamic> json) => FrontendApiCreds(
    googleSigninDeveloperKey: json["google_signin_developer_key"],
    googleSigninClientId: json["google_signin_client_id"],
    googleSigninAppId: json["google_signin_app_id"],
    msftSigninClientId: json["msft_signin_client_id"],
    msftSigninClientSecret: json["msft_signin_client_secret"],
    appleSigninClientId: json["apple_signin_client_id"],
    appleSigninClientSecret: json["apple_signin_client_secret"],
    googleAnalyticsScriptTag: json["google_analytics_script_tag"],
    matomoScriptTag: json["matomo_script_tag"],
    stripePubKey: json["stripe_pub_key"],
  );

  Map<String, dynamic> toJson() => {
    "google_signin_developer_key": googleSigninDeveloperKey,
    "google_signin_client_id": googleSigninClientId,
    "google_signin_app_id": googleSigninAppId,
    "msft_signin_client_id": msftSigninClientId,
    "msft_signin_client_secret": msftSigninClientSecret,
    "apple_signin_client_id": appleSigninClientId,
    "apple_signin_client_secret": appleSigninClientSecret,
    "google_analytics_script_tag": googleAnalyticsScriptTag,
    "matomo_script_tag": matomoScriptTag,
    "stripe_pub_key": stripePubKey,
  };
}
