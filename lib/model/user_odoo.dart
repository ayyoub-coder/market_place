// To parse this JSON data, do
//
//     final userOdoo = userOdooFromJson(jsonString);

import 'dart:convert';

UserOdoo userOdooFromJson(String str) => UserOdoo.fromJson(json.decode(str));

String userOdooToJson(UserOdoo data) => json.encode(data.toJson());

class UserOdoo {
  UserOdoo({
    this.jsonrpc,
    this.id,
    this.result,
  });

  String jsonrpc;
  dynamic id;
  Result result;

  factory UserOdoo.fromJson(Map<String, dynamic> json) => UserOdoo(
    jsonrpc: json["jsonrpc"],
    id: json["id"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "jsonrpc": jsonrpc,
    "id": id,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    this.uid,
    this.isSystem,
    this.isAdmin,
    this.userContext,
    this.db,
    this.serverVersion,
    this.serverVersionInfo,
    this.name,
    this.username,
    this.partnerDisplayName,
    this.companyId,
    this.partnerId,
    this.webBaseUrl,
    this.activeIdsLimit,
    this.userCompanies,
    this.currencies,
    this.showEffect,
    this.displaySwitchCompanyMenu,
    this.cacheHashes,
    this.userId,
    this.maxTimeBetweenKeysInMs,
    this.webTours,
    this.notificationType,
    this.odoobotInitialized,
  });

  int uid;
  bool isSystem;
  bool isAdmin;
  UserContext userContext;
  String db;
  String serverVersion;
  List<dynamic> serverVersionInfo;
  String name;
  String username;
  String partnerDisplayName;
  int companyId;
  int partnerId;
  String webBaseUrl;
  int activeIdsLimit;
  UserCompanies userCompanies;
  Map<String, Currency> currencies;
  String showEffect;
  bool displaySwitchCompanyMenu;
  CacheHashes cacheHashes;
  List<int> userId;
  int maxTimeBetweenKeysInMs;
  List<dynamic> webTours;
  String notificationType;
  bool odoobotInitialized;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    uid: json["uid"],
    isSystem: json["is_system"],
    isAdmin: json["is_admin"],
    userContext: UserContext.fromJson(json["user_context"]),
    db: json["db"],
    serverVersion: json["server_version"],
    serverVersionInfo: List<dynamic>.from(json["server_version_info"].map((x) => x)),
    name: json["name"],
    username: json["username"],
    partnerDisplayName: json["partner_display_name"],
    companyId: json["company_id"],
    partnerId: json["partner_id"],
    webBaseUrl: json["web.base.url"],
    activeIdsLimit: json["active_ids_limit"],
    userCompanies: UserCompanies.fromJson(json["user_companies"]),
    currencies: Map.from(json["currencies"]).map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
    showEffect: json["show_effect"],
    displaySwitchCompanyMenu: json["display_switch_company_menu"],
    cacheHashes: CacheHashes.fromJson(json["cache_hashes"]),
    userId: List<int>.from(json["user_id"].map((x) => x)),
    maxTimeBetweenKeysInMs: json["max_time_between_keys_in_ms"],
    webTours: List<dynamic>.from(json["web_tours"].map((x) => x)),
    notificationType: json["notification_type"],
    odoobotInitialized: json["odoobot_initialized"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "is_system": isSystem,
    "is_admin": isAdmin,
    "user_context": userContext.toJson(),
    "db": db,
    "server_version": serverVersion,
    "server_version_info": List<dynamic>.from(serverVersionInfo.map((x) => x)),
    "name": name,
    "username": username,
    "partner_display_name": partnerDisplayName,
    "company_id": companyId,
    "partner_id": partnerId,
    "web.base.url": webBaseUrl,
    "active_ids_limit": activeIdsLimit,
    "user_companies": userCompanies.toJson(),
    "currencies": Map.from(currencies).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "show_effect": showEffect,
    "display_switch_company_menu": displaySwitchCompanyMenu,
    "cache_hashes": cacheHashes.toJson(),
    "user_id": List<dynamic>.from(userId.map((x) => x)),
    "max_time_between_keys_in_ms": maxTimeBetweenKeysInMs,
    "web_tours": List<dynamic>.from(webTours.map((x) => x)),
    "notification_type": notificationType,
    "odoobot_initialized": odoobotInitialized,
  };
}

class CacheHashes {
  CacheHashes({
    this.loadMenus,
    this.qweb,
    this.translations,
  });

  String loadMenus;
  String qweb;
  String translations;

  factory CacheHashes.fromJson(Map<String, dynamic> json) => CacheHashes(
    loadMenus: json["load_menus"],
    qweb: json["qweb"],
    translations: json["translations"],
  );

  Map<String, dynamic> toJson() => {
    "load_menus": loadMenus,
    "qweb": qweb,
    "translations": translations,
  };
}

class Currency {
  Currency({
    this.symbol,
    this.position,
    this.digits,
  });

  String symbol;
  String position;
  List<int> digits;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    symbol: json["symbol"],
    position: json["position"],
    digits: List<int>.from(json["digits"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "position": position,
    "digits": List<dynamic>.from(digits.map((x) => x)),
  };
}

class UserCompanies {
  UserCompanies({
    this.currentCompany,
    this.allowedCompanies,
  });

  List<dynamic> currentCompany;
  List<List<dynamic>> allowedCompanies;

  factory UserCompanies.fromJson(Map<String, dynamic> json) => UserCompanies(
    currentCompany: List<dynamic>.from(json["current_company"].map((x) => x)),
    allowedCompanies: List<List<dynamic>>.from(json["allowed_companies"].map((x) => List<dynamic>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "current_company": List<dynamic>.from(currentCompany.map((x) => x)),
    "allowed_companies": List<dynamic>.from(allowedCompanies.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}

class UserContext {
  UserContext({
    this.lang,
    this.tz,
    this.uid,
  });

  String lang;
  String tz;
  int uid;

  factory UserContext.fromJson(Map<String, dynamic> json) => UserContext(
    lang: json["lang"],
    tz: json["tz"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "lang": lang,
    "tz": tz,
    "uid": uid,
  };
}
