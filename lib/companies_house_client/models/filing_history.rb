module CompaniesHouseClient
  class FilingHistory < Base
    belongs_to :company, path: "/company/:id"
    primary_key :transaction_id
    collection_path "/company/:company_id/filing-history"
  end
end