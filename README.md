# CompaniesHouseClient
A wrapper around the [Companies House Rest API](https://developer.companieshouse.gov.uk/api/docs/).

There is another gem which does this, [open-companies-house](https://github.com/tomblomfield/open-companies-house) but it doesn't include authentication.

## Installation

Install with [Bundler](http://bundler.io) like this:

```
gem 'companies_house_client'
```

Or manually:

```
gem install companies_house_client
```

## Setup

Set up CompaniesHouseClient in a block:

```
CompaniesHouseClient.configure do |config|
    config.api_token #your token from https://developer.companieshouse.gov.uk/developer/applications
    config.ssl_settings #this gem uses Faraday; you need to point it at the appropriate CA bundle for your platform
end

```

### SSL Setup
SSL is a bit of a faff, because you need a [CA bundle for Faraday](https://github.com/lostisland/faraday/wiki/Setting-up-SSL-certificates).
 
The configuration setting `ssl_settings` is a hash. You need to pass `ca_path` into it, with the appropriate location for your bundle.

## Use
```
c = CompaniesHouseClient::Company.find("company id")
c #returns a company.
```

## To do

* Officers
* Accounts

