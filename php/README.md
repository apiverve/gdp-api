# GDP Data API - PHP Package

Get GDP (Gross Domestic Product) data for any country including current values and historical data going back to 1960. With changes=true it also returns the direction against the previous year, and on paid plans the prior year's GDP, the dollar and percent change, whether real growth is accelerating or slowing, and 5- and 10-year compound annual growth.

## Installation

Install via Composer:

```bash
composer require apiverve/gdp
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Gdp\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'country' => 'US',
    'year' => 2023,
    'changes' => true
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Gdp\Client;
use APIVerve\Gdp\Exceptions\APIException;
use APIVerve\Gdp\Exceptions\ValidationException;

try {
    $response = $client->execute(['country' => 'US', 'year' => 2023, 'changes' => true]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "country": "US",
    "countryName": "United States",
    "currency": "USD",
    "year": 2025,
    "gdp": 30769700000000,
    "gdpFormatted": "$30.77 trillion",
    "gdpGrowth": 2.16,
    "gdpPerCapita": 90027,
    "count": 1,
    "years": [
      {
        "year": 2025,
        "gdp": 30769700000000,
        "gdpFormatted": "$30.77 trillion",
        "gdpGrowth": 2.16,
        "gdpPerCapita": 90027
      }
    ],
    "previousYear": 2024,
    "changeDirection": "up",
    "previousGdp": 29298013000000,
    "gdpChange": 1471687000000,
    "gdpChangePercent": 5.02,
    "previousGdpGrowth": 2.79,
    "growthTrend": "slowing",
    "gdpPerCapitaChangePercent": 4.48,
    "gdpCagr5y": 7.56,
    "gdpCagr10y": 5.34,
    "averageGrowth5y": 3.31
  },
  "code": 200
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/gdp?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/gdp?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/gdp?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
