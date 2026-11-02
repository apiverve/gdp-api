/// Response models for the GDP Data API.

/// API Response wrapper.
class GdpResponse {
  final String status;
  final dynamic error;
  final GdpData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  GdpResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory GdpResponse.fromJson(Map<String, dynamic> json) => GdpResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? GdpData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the GDP Data API.

class GdpData {
  String? country;
  String? countryName;
  String? currency;
  num? year;
  num? gdp;
  String? gdpFormatted;
  num? gdpGrowth;
  num? gdpPerCapita;
  num? count;
  List<GdpDataYearsItem>? years;

  GdpData({
    this.country,
    this.countryName,
    this.currency,
    this.year,
    this.gdp,
    this.gdpFormatted,
    this.gdpGrowth,
    this.gdpPerCapita,
    this.count,
    this.years,
  });

  factory GdpData.fromJson(Map<String, dynamic> json) => GdpData(
      country: json['country'],
      countryName: json['countryName'],
      currency: json['currency'],
      year: json['year'],
      gdp: json['gdp'],
      gdpFormatted: json['gdpFormatted'],
      gdpGrowth: json['gdpGrowth'],
      gdpPerCapita: json['gdpPerCapita'],
      count: json['count'],
      years: (json['years'] as List?)?.map((e) => GdpDataYearsItem.fromJson(e)).toList(),
    );
}

class GdpDataYearsItem {
  num? year;
  num? gdp;
  String? gdpFormatted;
  num? gdpGrowth;
  num? gdpPerCapita;

  GdpDataYearsItem({
    this.year,
    this.gdp,
    this.gdpFormatted,
    this.gdpGrowth,
    this.gdpPerCapita,
  });

  factory GdpDataYearsItem.fromJson(Map<String, dynamic> json) => GdpDataYearsItem(
      year: json['year'],
      gdp: json['gdp'],
      gdpFormatted: json['gdpFormatted'],
      gdpGrowth: json['gdpGrowth'],
      gdpPerCapita: json['gdpPerCapita'],
    );
}

class GdpRequest {
  String country;
  int? year;

  GdpRequest({
    required this.country,
    this.year,
  });

  Map<String, dynamic> toJson() => {
      'country': country,
      if (year != null) 'year': year,
    };
}
