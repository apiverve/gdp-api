# GDP Data API - Ruby Gem

Get GDP (Gross Domestic Product) data for any country including current values and historical data going back to 1960. With changes=true it also returns the direction against the previous year, and on paid plans the prior year's GDP, the dollar and percent change, whether real growth is accelerating or slowing, and 5- and 10-year compound annual growth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_gdp'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_gdp
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_gdp'

# Initialize the client
client = APIVerve::Gdp::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  country: "US",
  year: 2023,
  changes: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ country: "US", year: 2023, changes: true })
  puts response["data"]
rescue APIVerve::Gdp::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Gdp::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Gdp::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/gdp?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/gdp?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/gdp?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
