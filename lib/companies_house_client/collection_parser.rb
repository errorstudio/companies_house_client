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
      #todo - we need to parse out the :items hash from this.
    end
  end
end