module CompaniesHouseClient
  class Base
    include Her::Model
    use_api -> {CompaniesHouseClient.configuration.connection}
  end
end