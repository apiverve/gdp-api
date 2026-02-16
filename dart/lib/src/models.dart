/// Response models for the GDP Data API.

/// API Response wrapper.
class GdpResponse {
  final String status;
  final dynamic error;
  final GdpData? data;

  GdpResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory GdpResponse.fromJson(Map<String, dynamic> json) => GdpResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? GdpData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the GDP Data API.

class GdpData {
  String? country;
  String? countryName;
  String? currency;
  int? year;
  int? count;
  List<GdpDataHistoricalItem>? historical;

  GdpData({
    this.country,
    this.countryName,
    this.currency,
    this.year,
    this.count,
    this.historical,
  });

  factory GdpData.fromJson(Map<String, dynamic> json) => GdpData(
      country: json['country'],
      countryName: json['countryName'],
      currency: json['currency'],
      year: json['year'],
      count: json['count'],
      historical: (json['historical'] as List?)?.map((e) => GdpDataHistoricalItem.fromJson(e)).toList(),
    );
}

class GdpDataHistoricalItem {
  int? year;
  int? gdp;
  String? gdpFormatted;
  double? gdpGrowth;
  int? gdpPerCapita;

  GdpDataHistoricalItem({
    this.year,
    this.gdp,
    this.gdpFormatted,
    this.gdpGrowth,
    this.gdpPerCapita,
  });

  factory GdpDataHistoricalItem.fromJson(Map<String, dynamic> json) => GdpDataHistoricalItem(
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
