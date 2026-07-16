# GDP Data API - PHP Package

Get GDP (Gross Domestic Product) data for any country including current values and historical data going back to 1960.

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
    'year' => 2023
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
    $response = $client->execute(['country' => 'US', 'year' => 2023]);
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
    "year": 2023,
    "gdp": 27360935000000,
    "gdpFormatted": "$27.36 trillion",
    "gdpGrowth": 2.54,
    "gdpPerCapita": 81632,
    "count": 1,
    "years": [
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/gdp?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/gdp?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/gdp?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
