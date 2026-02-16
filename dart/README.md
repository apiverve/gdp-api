# GDP Data API - Dart/Flutter Client

Get GDP (Gross Domestic Product) data for any country including current values and historical data going back to 1960.

[![pub package](https://img.shields.io/pub/v/apiverve_gdp.svg)](https://pub.dev/packages/apiverve_gdp)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [GDP Data API](https://apiverve.com/marketplace/gdp?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_gdp: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_gdp/apiverve_gdp.dart';

void main() async {
  final client = GdpClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'country': 'US',
      'year': 2023
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "country": "USA",
    "countryName": "United States",
    "currency": "USD",
    "year": 2023,
    "count": 1,
    "historical": [
      {
        "year": 2023,
        "gdp": 27360935000000,
        "gdpFormatted": "$27.36 trillion",
        "gdpGrowth": 2.54,
        "gdpPerCapita": 81632
      }
    ]
  },
  "code": 200
}
```

## API Reference

- **API Home:** [GDP Data API](https://apiverve.com/marketplace/gdp?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/gdp](https://docs.apiverve.com/ref/gdp?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
