module CompaniesHouseClient

  # Clean up collections, which look like this:
  # {
  #   "total_results": 4,
  #   "items": [
  #     { }, #some item
  #     { }, #some item
  #   ]
  # }
  class CollectionParser < Faraday::Response::Middleware
    def on_complete(env)
      json = MultiJson.load(env[:body], symbolize_keys: true)
      env[:body] = {
        data: json.has_key?(:items) ? json[:items] : json
      }
    end
  end
end