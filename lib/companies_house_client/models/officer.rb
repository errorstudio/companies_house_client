module CompaniesHouseClient
  class Officer < Base
    belongs_to :company
    # parse_root_in_json :items
    collection_path "/companies/:company_number/officers"
  end
end