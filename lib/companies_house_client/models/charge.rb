module CompaniesHouseClient
  class Appointment < Base
    belongs_to :company, path: "/company/:id"
    collection_path "/company/:company_id/charges"
  end
end