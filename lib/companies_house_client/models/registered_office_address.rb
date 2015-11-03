module CompaniesHouseClient
  class RegisteredOfficeAddress < Base
    belongs_to :company, path: "/company/:id"
    collection_path "/company/:company_id/registered-office-address"
  end
end