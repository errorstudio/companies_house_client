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

### Getting a company by Company Number
Note that the leading zero in a company number is important so you have to pass `find()` a string.
```
c = CompaniesHouseClient::Company.find("company number")
c #returns a company.
```

### Searching for a company by name
You can search for a company like this:

```
companies = CompaniesHouseClient::Company.search("your search", per_page: 10, page: 2)
companies #returns a collection of Companies which match your search.
```

`per_page` and `page` are optional.

### Company Officers
Companies have many officers. You can retrieve them like this:

```
c = CompaniesHouseClient::Company.find("company number")
c.officers #returns a collection of Officer objects.
```


## To do

* We should be able to get a history of accounts.

# Licence
This gem is MIT licenced. Have fun!