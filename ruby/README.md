# GDP Data API - Ruby Gem

Get GDP (Gross Domestic Product) data for any country including current values and historical data going back to 1960.

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
  year: 2023
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ country: "US", year: 2023 })
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/gdp?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/gdp?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/gdp?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
