module CompaniesHouseClient
  class Officer < Base
    belongs_to :company, path: "/company/:id"
    collection_path "/company/:company_id/officers"
  end
end